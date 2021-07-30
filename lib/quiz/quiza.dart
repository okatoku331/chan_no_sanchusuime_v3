import 'package:cloud_firestore/cloud_firestore.dart';

class Quiza {
  Quiza(DocumentSnapshot doc) {
    quizID = doc.id;
    quizaTitle = doc['quizaTitle'];
    quizaURL = doc['quizaURL'];
  }

  String quizID;
  String quizaTitle;
  String quizaURL;
}
