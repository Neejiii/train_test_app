import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddState();


}


class _AddState extends State<AddItem> {

  String? text1;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  String? text6;
  List items = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff5ac208),
        title: Text('Train'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/newItem');
          },
        ),
        actions: <Widget>[


        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(child: Text('Номер поезда', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              text1 = value;},
          ), flex: 1,),

          Flexible(child: Text('Пункт отправления', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            onChanged: (String value) {
              text2 = value;},
          ), flex: 1,),

          Flexible(child: Text('Пункт назначения', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            onChanged: (String value) {
              text3 = value;},
          ), flex: 1,),

          Flexible(child: Text('Время отправления', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              text4 = value;},
          ), flex: 1,),

          Flexible(child: Text('Время прибытия', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              text5 = value;},
          ), flex: 1,),

          Flexible(child: Text('Стоимость билета', style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roberto',
          ),), flex: 1,),
          Flexible(child: TextField(
            keyboardType: TextInputType.number,
            onChanged: ( value) {
              text6 = value;},
          ), flex: 1,),

          Flexible(child: ElevatedButton(onPressed: () {
            FirebaseFirestore.instance.collection('items').add({'number': text1, 'departure': text2, 'destination': text3, 'timedep': text4, 'timedes': text5, 'price' : text6});
            Navigator.pushReplacementNamed(context, '/newItem');
          }, child: Text('Добавить'),),),

    ],
    )
    );

  }
}