import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';

class AnswerPage extends StatelessWidget {
  final String quizNoMoji;

  AnswerPage({
    Key key,
    this.quizNoMoji,
  }) : super(key: key);

  //quizNo = int.parse(quizNoMoji) - 1;

  final List<String> imageURL = [
    'https://thumb.ac-illust.com/e5/e58cc5ca94270acaceed13bc82dfedf7_w.jpg',
    'https://thumb.ac-illust.com/06/06954109ebef088c4cf93bad9ecfa0bb_w.jpg',
    'https://thumb.ac-illust.com/8c/8ce2f461f2ee67eaa3ac2baa082d28c3_w.jpg'
  ];
  final List<String> answerURL = ['answerURL0', 'answerURL1', 'answerURL2'];

  //double buttonSpace = 12.0;
  //List<String> buttonNo = ['<< ホームページに戻る', '次の問題に挑戦する >', '3', '4', '5'];

  //List<Book> books = [];
  //List<String> imageURL;
  //List<String> _emails;

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
                        //Padding(padding: EdgeInsets.all(buttonSpace)),
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
                            //Navigator.pop(context);
                            //buttonSpace = 12.0;
                            //setState(() {});
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
                            //Navigator.pop(context);
                            Navigator.pop(context);
                            //Navigator.pop(context);
                            //buttonSpace = 12.0;
                            //setState(() {});
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
