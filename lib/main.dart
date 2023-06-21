import 'package:flutter/material.dart';

import 'shoaib/jahanzaib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DinMuhammad(),
    );
  }
}
