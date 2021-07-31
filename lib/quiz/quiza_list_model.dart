import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/quiza.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizaListModel extends ChangeNotifier {
  List<Quiza> quizas = [];

  Future fetchQuiza() async {
    final docs = await FirebaseFirestore.instance.collection('quizas').get();
    final quizas = docs.docs.map((doc) => Quiza(doc)).toList();
    this.quizas = quizas;
    notifyListeners();
  }

  Future deleteQuiza(Quiza quiza) async {
    await FirebaseFirestore.instance
        .collection('quizas')
        .doc(quiza.quizID)
        .delete();
  }

  Future getQuiza(Quiza quiza) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('quizas')
        .doc(quiza.quizID)
        .get();

    print(snapshot);
    ;
    return snapshot;
  }
}
