import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:chan_no_sanchusuimei_v3/book_list/login_page.dart';

class Update3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('update').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          final List<String> lineList = [
            'line1',
            'line2',
            'line3',
            'line4',
            'line5',
            'line6',
            'line7',
            'line8',
            'line9',
            'line10',
            'line11',
            'line12',
            'line13',
            'line14',
            'line15',
            'line16',
            'line17',
            'line18',
            'line19',
            'line20',
            'line21',
            'line22',
            'line23',
            'line24',
            'line25',
            'line26',
            'line27',
            'line28',
            'line29',
            'line30',
            'line31',
            'line32',
            'line33',
            'line34',
            'line35',
            'line36',
            'line37',
            'line38',
            'line39',
            'line40',
            'line47',
            'line41',
            'line42',
            'line43',
            'line44',
            'line45',
            'line46',
          ];
          //final List<String> lineList = snapshot.data.docs[0]['aLine'];
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.docs[0]['line0']),
            ),
            body: ListView.builder(
                itemCount: lineList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data.docs[0][lineList[index]]),
                  );
                }),
          );
        });
  }
}
