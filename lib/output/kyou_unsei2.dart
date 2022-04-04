import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KyouUnsei2 extends StatelessWidget {
  //const KyouUnsei2({Key key}) : super(key: key);

  List<String> moji = [
    '今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は今日の運勢は',
    'あなたの日干は壬で、',
    '今日の日干は丙なので、',
    '下記の図のように',
    '正財になります。②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）②機転が効き、頭の良い星（手抜きを②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）②機転が効き、頭の良い星（手抜きをした割にには勉強②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）②機転が効き、頭の良い星（手抜きを②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直ができる　遊んでから勉強する　直前に徹夜で勉強する）した割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）'
  ];
  List<String> zu = [
    'images/tuuhenbosi/05.jpg',
    'images/tuuhenbosi/05.jpg',
    'images/tuuhenbosi/05.jpg',
    'images/tuuhenbosi/05.jpg',
    'images/tuuhenbosi/07.jpg'
  ];

  //List<int> iroMoji = [0xFFFFFFFF, 0xFFEA80FC, 0xFFE040FB, 0, 0xFF0500f9];
  List<int> iroMoji = [-1, -1407770, -1, -1, -1];
  List<double> takasaMoji = [110.0, 25.0, 25.0, 50.0, 525.0];
  List<double> takasaZu = [0.0, 0.0, 0.0, 240.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '今日の運勢  ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: takasaMoji[index],
                    child: ListTile(
                      tileColor: Colors.black,
                      title: Text(
                        moji[index],
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 17,
                          color: Color(iroMoji[index]),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: takasaZu[index],
                    child: ListTile(
                      title: Image.asset(zu[index]),
                      tileColor: Colors.black,
                    ),
                  ),
                ],
              );
            },
          )),

          Container(
            height: 8,
          ),
          SizedBox(
            height: 0,
            child: Container(
              color: Colors.purpleAccent,
            ),
          ), // Ads
          Container(
            height: 0,
          ),
        ],
      ),
    );
  }
}
