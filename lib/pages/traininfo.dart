import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusText = Text('Train');
  TextEditingController textController = TextEditingController();

  String? i1;
  String? i2;
  List items = [];
  bool flag = true;

  void BooksFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    items.addAll(['aaa', 'bb']);
  }

  Widget build(BuildContext context) {
    BooksFirebase();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Color(0xff5ac208),
        title: flag
            ? TextField(
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Поиск по товарам"),
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                controller: textController,
                onChanged: (str) {
                  setState(() {});
                })
            : Text('Train'),
        centerTitle: true,
        leading: IconButton(
            icon: flag ? Icon(Icons.cancel) : Icon(Icons.search),
            onPressed: () {
              setState(() {
                if(flag) {
                  textController.text = '';
                }
                flag = !flag;
              });
              ;
            }),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
          Navigator.pushReplacementNamed(context, '/choice');
          }),
          // IconButton(
          //     icon: Icon(Icons.shopping_cart),
          //     onPressed: () {
          //       Navigator.pushReplacementNamed(context, '/cart');
          //     }),
          IconButton(
              icon: Icon(Icons.add_circle_rounded),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/AddItem');
              }),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('items').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) =>
                    snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return snapshot.data!.docs[index]
                                      .get('destination')
                                      .toString()
                                      .contains(textController.text)
                                  ? Dismissible(
                                      key: Key(snapshot.data!.docs[index].id),
                                      child: Card(
                                        color: Color(0xfff1ffff),
                                        child: ListTile(
                                          title: Column(
                                            children: [
                                              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                              Text(snapshot.data?.docs[index]
                                                  .get('destination')),
                                            ],
                                          ),
                                          subtitle: Column(
                                            children: [
                                              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                              Column( children: [
                                                Text(snapshot.data?.docs[index]
                                                    .get('departure') + ' - Отправление'),
                                                SizedBox(width: 10,),
                                                Text(snapshot.data?.docs[index]
                                                    .get('number')+ ' - Номер'),
                                              ],),
                                              Column( children: [
                                                Text(snapshot.data?.docs[index]
                                                    .get('timedep')+ ' - Отправление'),
                                                SizedBox(width: 10,),
                                                Text(snapshot.data?.docs[index]
                                                    .get('timedes') + ' - Прибытие'),

                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              Text(snapshot.data?.docs[index]
                                                  .get('price') + ' Р.'),
                                              SizedBox(width: 15,),
                                            ]),
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        FirebaseFirestore.instance
                                            .collection('items')
                                            .doc(snapshot.data!.docs[index].id)
                                            .delete();
                                      },
                                    )
                                  : Container();
                            },
                          )
                        : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
