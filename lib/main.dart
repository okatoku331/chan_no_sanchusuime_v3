import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('asd'),
        ),
        body: Text('Kboyさんじゃないよ',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
