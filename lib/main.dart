import 'package:flutter/material.dart';
import 'StartRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sports Blog",
      home: StartRoute(),
    );
  }

}