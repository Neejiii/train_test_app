

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/newItem');
          },
        ),
      ),
      body: Column( children: [
        SizedBox(height: 24),
        Center ( child: Text('Сортировать по:',
          style: TextStyle (
          color: Colors.black,
          fontSize: 21,
          fontFamily: 'Roberto',
        ),
        ),),
        SizedBox(height: 160),
        TextButton(
          child: Text("Время прибытия", style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Roberto',
          ),),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/ThisItem');
          },
        ),
        SizedBox(height: 30),
        TextButton(
          child: Text("Пункт отправления", style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Roberto',
          ),),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/chanc');
          },
        ),
        SizedBox(height: 30),
        TextButton(
          child: Text("Пункт назначения", style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Roberto',
          ),),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/newItem');
          },
        ),
      ],),

    );
  }
}
