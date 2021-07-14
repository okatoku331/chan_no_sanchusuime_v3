import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力して下さい');
    }
    FirebaseFirestore.instance.collection('books').add({
      'title': bookTitle,
      'createdAT': Timestamp.now(),
    });
  }

  Future updateBook(Book book) async {
    final document =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    await document.update({
      'title': bookTitle,
      'updatedAT': Timestamp.now(),
    });
  }
}
