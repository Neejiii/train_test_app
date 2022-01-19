import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainflutter/pages/addtrain.dart';
import 'package:trainflutter/pages/traininfo.dart';
import 'package:trainflutter/pages/choice.dart';
import 'package:trainflutter/pages/timeinfo.dart';
import 'package:trainflutter/pages/placeinfo.dart';

Future<bool> booksFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return true;
}

void main() {
  booksFirebase().then((value) =>
      runApp(MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/newItem',
        routes: {
          '/newItem': (context) => Home(),
          '/AddItem': (context) => AddItem(),
          '/ThisItem': (context) => This(),
          '/chanc': (context) => chanc(),
          '/choice': (context) => Choice(),
        },
      )));
}
