import 'package:chan_no_sanchusuimei_v3/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBooks() async {
    final docs = await FirebaseFirestore.instance.collection('books').get();
    final books = docs.docs.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}
