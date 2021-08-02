import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListPageB extends StatelessWidget {
  //const BookListPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quizas').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.docs[0]['quizaTitle']),
            ),
            body: Column(
              children: [
                Image.network(snapshot.data.docs[0]['quizaURL']),
                Text(snapshot.data.docs[1]['quizaTitle']),
              ],
            ),
          );
        });
  }
}
