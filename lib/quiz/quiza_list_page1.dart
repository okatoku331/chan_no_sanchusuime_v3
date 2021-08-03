import 'package:chan_no_sanchusuimei_v3/book_list//book_list_model.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/add_book_page.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiza.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiza_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizaListPage1 extends StatelessWidget {
  double buttonSpace = 24.0;
  List<String> buttonNo = ['1', '2', '3', '4', '5'];
  final List<String> imageURL = [
    'https://thumb.ac-illust.com/e5/e58cc5ca94270acaceed13bc82dfedf7_w.jpg',
    'https://thumb.ac-illust.com/06/06954109ebef088c4cf93bad9ecfa0bb_w.jpg',
    'https://thumb.ac-illust.com/8c/8ce2f461f2ee67eaa3ac2baa082d28c3_w.jpg'
  ];
  final List<String> quizaURL = [];
  //imageURL.add(quiza.quizaURL);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizaListModel>(
      create: (_) => QuizaListModel()..fetchQuiza(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('クイズ一覧'),
        ),
        body: Consumer<QuizaListModel>(
          builder: (context, model, child) {
            final quizas = model.quizas;

            /*final quizaURL = quizas.map( (quiza) => listListTile(
                    leading: Image.network(quizURL = quiza.quizaURL),
                    title: Text(quiza.quizaTitle),
                  ),
                )
                .toList();*/
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 480,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Image.network(imageURL[index]),
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
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(padding: EdgeInsets.all(buttonSpace)),
                                  ElevatedButton(
                                    child: Text(buttonNo[index]),
                                    onPressed: () {
                                      buttonSpace = 24.0;
                                      //getQuiza();
                                      //fetchUserData();
                                      //setState(() {});
                                    },
                                  ),
                                ],
                              );
                            })),
                  ),
                ],
              ),
            ) /*ListView(
              children: listTiles,
            )*/
                ;
            print(quizas);
          },
        ),
      ),
    );
  }
}