import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KyouUnsei2 extends StatelessWidget {
  //const KyouUnsei2({Key? key}) : super(key: key);
  List<String> titleList = ['amzon', '楽天', 'Yahoo!'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('練習'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
                ListTile(
                  title: Text('練習１'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 20.0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(titleList[0]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
