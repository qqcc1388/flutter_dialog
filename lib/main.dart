
import 'package:flutter/material.dart';
import 'package:flutter_dialog/home.dart';

// void mian() => runApp(MyApp());
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: HomePage(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: '',
    //   home: HomePage(),
    // );
//   }
// }
