import 'package:chan_no_sanchusuimei_v3/answer/answer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 次の行は消すな！
// ignore: must_be_immutable
class QuizPage extends StatelessWidget {
  final String quizNoMoji;
  String bestQuizNoMoji;

  QuizPage({Key key, this.quizNoMoji, this.bestQuizNoMoji}) : super(key: key);

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
          if (!snapshot.hasData) return const Text('Loading...');
          int quizNo = int.parse(quizNoMoji) - 1;
          int bestquizNo = int.parse(bestQuizNoMoji) - 1;
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.docs[quizNo]['quizaTitle']),
            ),
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    //height: 480,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(padding: EdgeInsets.all(buttonSpace)),
                                  ElevatedButton(
                                    child: Text(buttonNo[index]),
                                    onPressed: () async {
                                      if (buttonNo[index] ==
                                          snapshot.data.docs[quizNo]['seikai']
                                              .toString()) {
                                        kotae = 'o';
                                        if (quizNo > bestquizNo) {
                                          bestQuizNoMoji = quizNoMoji;
                                          //TODO:端末にsetする
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setString('bestQuizNoMojiP',
                                              bestQuizNoMoji);
                                        } else {}
                                      } else {
                                        kotae = 'x';
                                      }
                                      _showKotae(context);
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
                                  bestQuizNoMoji: bestQuizNoMoji,
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
                                  bestQuizNoMoji: bestQuizNoMoji,
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

//TODO:選択ボタンが２の時のスペース調整
