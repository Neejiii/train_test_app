import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int? i;
  List knigi = [];
  int? sum;

  void BooksFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7fdfd),
      appBar: AppBar(
        title: Text('Books'),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Вернуться к товарам",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/newItem');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Text(
              'Корзина пуста',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: 'Roberto'),
            );
          knigi = [];
          snapshot.data!.docs
              .forEach((elem) => knigi.add(int.parse(elem.get('price'))));
          sum = knigi.reduce((a, b) => a + b);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(snapshot.data!.docs[index].id),
                        child: Card(
                          child: ListTile(
                            title: Text(snapshot.data!.docs[index].get('name')),
                            subtitle: Text(
                                snapshot.data!.docs[index].get('price') + ' Р'),
                          ),
                        ),
                        onDismissed: (direction) {
                          FirebaseFirestore.instance
                              .collection('cart')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      );
                    }),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text('Сумма: $sum'),
              )
            ],
          );
        },
      ),
    );
  }
}
