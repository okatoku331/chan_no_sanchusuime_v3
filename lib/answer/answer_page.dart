import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final String quizNoMoji;

  AnswerPage({
    Key key,
    this.quizNoMoji,
  }) : super(key: key);

  final List<String> answerURL = ['answerURL0', 'answerURL1', 'answerURL2'];

  @override
  //final int quizNo = int.parse(quizNoMoji) - 1;

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quizas').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          int quizNo = int.parse(quizNoMoji) - 1;
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.docs[quizNo]['quizaTitle']),
            ),
            body: Container(
              color: Colors.white,
              child: Column(children: [
                SizedBox(
                  height: 480,
                  child: ListView.builder(
                      itemCount: snapshot.data.docs[quizNo]['answerLength'],
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Image.network(
                              snapshot.data.docs[quizNo][answerURL[index]]),
                        );
                      }),
                ),
                SizedBox(
                  height: 60,
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text('<< ホームページ'),
                          onPressed: () {
                            /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnswerPage(),
                                  ),
                                );*/
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text('次の問題 >'),
                          onPressed: () {
                            /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnswerPage(),
                                  ),
                                );*/
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
