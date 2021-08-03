import 'package:chan_no_sanchusuimei_v3/main/main.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiz_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  String quizNoMoji;

  AnswerPage({
    Key key,
    this.quizNoMoji,
  }) : super(key: key);

  final List<String> answerURL = ['answerURL0', 'answerURL1', 'answerURL2'];
  String kotaeMoji;

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                            /*Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);*/
                          },
                        ),
                        ElevatedButton(
                          child: Text('次の問題 >'),
                          onPressed: () {
                            if (snapshot.data.docs[quizNo]['quizaLast'] ==
                                true) {
                              _showQuizLast(context);
                            } else {
                              quizNoMoji = (quizNo + 2).toString();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizPage(
                                    quizNoMoji: quizNoMoji,
                                  ),
                                ),
                              );
                            }

                            /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnswerPage(),
                                  ),
                                );*/
                            //Navigator.pop(context);
                            //Navigator.pop(context);
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

  // 画面下からDatePickerを表示する
  void _showQuizLast(BuildContext context) {
    kotaeMoji = '全問終了しました。';

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.blue,
            height: 120,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // キャンセル　ボタン
                      TextButton(
                        child: Text(
                          '$kotaeMoji',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}