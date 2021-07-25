import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  Quiz(DocumentSnapshot doc) {
    quizID = doc.id;
    quizTitle = doc['quizTitle'];
    quizURL = doc['quizURL'];
    sentakusi = doc['sentakusi'];
    seikai = doc['seikai'];
    kaisetGazouSuu = doc['kaisetGazouSuu'];
    kaisetURL1 = doc['kaisetURL1'];
    kaisetURL2 = doc['kaisetURL2'];
    kaisetURL3 = doc['kaisetURL3'];
    endQuiz = doc['endQuiz'];
  }

  String quizID; //クイズ番号
  String quizTitle; //クイズ番号
  String quizURL; //クイズ画面
  int sentakusi; //選択肢数(0-4)
  int seikai; //正解番号(0-4)
  int kaisetGazouSuu; //解説画像数(0-2)
  String kaisetURL1; //解説画像１
  String kaisetURL2; //解説画像２
  String kaisetURL3; //解説画像３
  bool endQuiz; //最終質問：true

}
