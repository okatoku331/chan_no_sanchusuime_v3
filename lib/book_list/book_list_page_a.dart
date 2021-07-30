import 'package:chan_no_sanchusuimei_v3/book_list//book_list_model.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/add_book_page.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('1. 易とは'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles = books
                .map(
                  (book) => ListTile(
                    leading: Image.network(book.imageURL),
                    title: Text(book.title),
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
      ),
    );
  }
}
