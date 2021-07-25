//import 'package:chan_no_sanchusuimei_v3/quiz/quiz001.dart';
import 'package:flutter/material.dart';

class Answer001 extends StatefulWidget {
  //const({Key key}):super(key: key);

  @override
  _Answer001State createState() => _Answer001State();
}

class _Answer001State extends State<Answer001> {
  String kotae = 'x';
  String kaitou = 'x';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('易とは'),
      ),
      body: Container(
        color: Colors.black87,
        child: Container(
          child: ListView(
            children: [
              ListTile(
                title: Image.asset('images/quiz/a0010.png'),
              ),
              ListTile(
                title: Image.asset('images/quiz/a0011.png'),
              ),
              //ListTile(
              //title: Text(''),
              //),
              ElevatedButton(
                child: Text('次のクイズに挑戦する'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz001(),
                    ),
                  );*/
                },
              ),
              ElevatedButton(
                child: Text('クイズを終了する'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ), //containe
      ),
    );
  }
}
