import 'package:chan_no_sanchusuimei_v3/answer/answer001.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/add_book_model.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz.dart';

class QuizPage extends StatelessWidget {
  QuizPage({this.quize});

  final Quiz quize;

  String kotae = 'x';
  String kaitou = 'x';
  String kotaeMoji = '';

  @override
  Widget build(BuildContext context) {
    //final bool isUpdate = quize != null;
    //final textEditingController = TextEditingController();
    //if (isUpdate) {
    // textEditingController.text = quize.quizTitle;
    //}
    return ChangeNotifierProvider<QuizModel>(
      create: (_) => QuizModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('易占検定'),
        ),
        body: Consumer<QuizModel>(
          builder: (context, model, child) {
            return Container(
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 4,
                    ),
                    // 一行目の表示
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Image.asset('images/quiz/q001.png'),
                              ),
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          //TODO: 1 を選んだときの処理
                                          kotae = 'x';
                                          kaitou = 'o';
                                          _showKotae(context);
                                        },
                                        child: Text('1')),
                                    ElevatedButton(
                                        onPressed: () {
                                          //TODO: 2 を選んだときの処理
                                          kotae = 'o';
                                          kaitou = 'o';
                                          _showKotae(context);
                                        },
                                        child: Text('2')),
                                    ElevatedButton(
                                        onPressed: () {
                                          //TODO: 3 を選んだときの処理
                                          kotae = 'x';
                                          kaitou = 'o';
                                          _showKotae(context);
                                        },
                                        child: Text('3')),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // 1行目の表示　ここまで
                  ],
                ),
              ),
            ); //
          }, //この前に
        ),
      ),
    );
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
                                builder: (context) => Answer001(),
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
                                builder: (context) => Answer001(),
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
