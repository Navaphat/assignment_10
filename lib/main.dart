import 'package:flutter/material.dart';
import 'CustomWidget.dart';
import 'CustomWidget2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //scaffoldBackgroundColor: ,
        primarySwatch: Colors.blue,
      ),
      home: customWidget2(),
    );
  }
}
