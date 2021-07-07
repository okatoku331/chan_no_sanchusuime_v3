import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Touroku extends StatelessWidget {
  const Touroku({Key key}) : super(key: key);

  //List<String> birthday = ['1957/03/31','1957/07/14','1997/02/08'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('生年月日登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                    child: Text(
                        '12',
                    style: TextStyle(
                      fontSize: 22,
                    ),)
                ),
                Container(
                    width: 30,
                    child: Text('：',
                    style: TextStyle(
                      fontSize: 22,
                    ),)
                ),
                Container(
                    width: 130,
                    child: Text('1957/03/31',
                    style: TextStyle(
                      fontSize: 22,
                    ),)
                ),
                Container(
                    width: 20,
                    child: Text('生',
                    style: TextStyle(
                      fontSize: 18,
                    ),)
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: Icon(Icons.arrow_forward),
      //drawer: Drawer(),
    );
  }
}
