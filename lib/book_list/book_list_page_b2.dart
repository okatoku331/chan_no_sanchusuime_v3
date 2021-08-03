import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListPageB extends StatelessWidget {
  //const BookListPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1.易とは(StreamBuilder)'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('books').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Column(
              children: [
                Image.network(snapshot.data.docs[0]['imageURL']),
                Text(snapshot.data.docs[0]['title']),
              ],
            );
          }),
    );
  }
}