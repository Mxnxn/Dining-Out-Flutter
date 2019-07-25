import 'package:flutter/material.dart';
import 'package:blemacion_app/pages/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinning Out',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
