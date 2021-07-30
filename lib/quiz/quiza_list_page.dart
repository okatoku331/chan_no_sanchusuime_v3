import 'package:chan_no_sanchusuimei_v3/book_list//book_list_model.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/add_book_page.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiza.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiza_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizaListPage extends StatelessWidget {
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
            final listTiles = quizas
                .map(
                  (quiza) => ListTile(
                    leading: Image.network(quiza.quizaURL),
                    title: Text(quiza.quizaTitle),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        /*await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddQizaPage(
                          quiza: quiza,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                    model.fetchQuiza();*/
                      },
                    ),
                    onLongPress: () {
                      //TODO:削除する
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('${quiza.quizaTitle} を削除しますか？'),
                            actions: [
                              TextButton(
                                child: Text('cansel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  //TODO:削除するを実行する
                                  deleteQuiza(context, model, quiza);

                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<QuizaListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              //TODO:追加する処理
              /*await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuizaPage(),
                  fullscreenDialog: true,
                ),
              );
              model.fetchQuiza();*/
            },
          );
        }),
      ),
    );
  }

  Future deleteQuiza(
      BuildContext context, QuizaListModel model, Quiza quiza) async {
    try {
      await model.deleteQuiza(quiza);
      await model.fetchQuiza();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }
}
