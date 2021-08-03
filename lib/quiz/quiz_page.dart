import 'package:chan_no_sanchusuimei_v3/answer/answer_page.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';

class QuizPage extends StatelessWidget {
  final String quizNoMoji = '1';
  final List<String> imageURL = [
    'https://thumb.ac-illust.com/e5/e58cc5ca94270acaceed13bc82dfedf7_w.jpg',
    'https://thumb.ac-illust.com/06/06954109ebef088c4cf93bad9ecfa0bb_w.jpg',
    'https://thumb.ac-illust.com/8c/8ce2f461f2ee67eaa3ac2baa082d28c3_w.jpg'
  ];

  double buttonSpace = 24.0;
  List<String> buttonNo = ['1', '2', '3', '4', '5'];

  List<Book> books = [];
  //List<String> imageURL;
  List<String> _emails;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quizas').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.docs[0]['quizaTitle']),
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
                                snapshot.data.docs[0]['quizaURL']),
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
                            itemCount: snapshot.data.docs[0]['sentakusi'],
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
                                      //buttonSpace = 24.0;
                                      //setState(() {});
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
