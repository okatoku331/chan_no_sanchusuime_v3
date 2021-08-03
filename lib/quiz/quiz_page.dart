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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AnswerPage(
                                            quizNoMoji: quizNoMoji,
                                          ),
                                        ),
                                      );
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
}
