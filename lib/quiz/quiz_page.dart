import 'package:chan_no_sanchusuimei_v3/answer/answer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final String quizNoMoji;

  QuizPage({
    Key key,
    this.quizNoMoji,
  }) : super(key: key);

  //final String quizNoMoji = '1';
  double buttonSpace = 24.0;
  List<String> buttonNo = ['1', '2', '3', '4', '5'];
  String kotae;
  String kotaeMoji;
  String iro;

  @override
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
              child: Column(
                children: [
                  SizedBox(
                    height: 480,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Image.network(
                                snapshot.data.docs[quizNo]['quizaURL']),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    child: Container(
                        constraints: BoxConstraints.expand(),
                        color: Colors.black,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs[quizNo]['sentakusi'],
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(padding: EdgeInsets.all(buttonSpace)),
                                  ElevatedButton(
                                    child: Text(buttonNo[index]),
                                    onPressed: () {
                                      if (buttonNo[index] ==
                                          snapshot.data.docs[quizNo]['seikai']
                                              .toString()) {
                                        kotae = 'o';
                                      } else {
                                        kotae = 'x';
                                      }
                                      _showKotae(context);
                                      /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AnswerPage(
                                            quizNoMoji: quizNoMoji,
                                          ),
                                        ),
                                      );*/
                                    },
                                  ),
                                ],
                              );
                            })),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // 画面下からDatePickerを表示する
  void _showKotae(BuildContext context) {
    if (kotae == 'o') {
      kotaeMoji = 'すばらしい！正解です。';
    } else {
      kotaeMoji = '残念！不正解です。';
    }
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
                          if (kotae == 'o') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnswerPage(
                                  quizNoMoji: quizNoMoji,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).pop();
                          }
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
                          if (kotae == 'o') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnswerPage(
                                  quizNoMoji: quizNoMoji,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).pop();
                          }
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
