import 'package:admob_flutter/admob_flutter.dart';
import 'package:chan_no_sanchusuimei_v3/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nikkan/nikkan_kinoe.dart';
import 'nikkan/nikkan_kinoto.dart';
import 'nikkan/nikkan_hinoe.dart';
import 'nikkan/nikkan_hinoto.dart';
import 'nikkan/nikkan_tsutinoe.dart';
import 'nikkan/nikkan_tsutinoto.dart';
import 'nikkan/nikkan_kanoe.dart';
import 'nikkan/nikkan_kanoto.dart';
import 'nikkan/nikkan_mizunoe.dart';
import 'nikkan/nikkan_mizunoto.dart';
import 'services/admob.dart';

class NikkanJump extends StatelessWidget {
  DateTime Date0 = DateTime(1900, 1, 1);
  DateTime Date2 = DateTime(1957, 3, 31);
  int nissuu = 0;
  int nikkan = 0;

  //nissuu = Date2.difference(Date0).inDays;
  //nikkan = nissuu % 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日干JUMP'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('$nikkan'),
            ),
            ListTile(
              title: Text('$Date2'),
            ),

            //nissuu = Date2.difference(Date0).inDays;
            //nikkan = nissuu % 10;
            //print('$Date0');
            //print('$Date2');
            //print('$nissuu');
            //print('$nikkan')

            RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                nissuu = Date2.difference(Date0).inDays;
                nikkan = nissuu % 10;

                //print('$Date0');
                //print('$Date2');
                //print('$nissuu');
                //print('$nikkan');
                if (nikkan == 0) {
                  //print('甲');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanKinoe()),
                  );
                } else if (nikkan == 1) {
                  //print('乙');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanKinoto()),
                  );
                } else if (nikkan == 2) {
                  //print('丙');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanHinoe()),
                  );
                } else if (nikkan == 3) {
                  //print('丁');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanHinoto()),
                  );
                } else if (nikkan == 4) {
                  //print('戊');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanTsutinoe()),
                  );
                } else if (nikkan == 5) {
                  //print('己');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanTsutinoto()),
                  );
                } else if (nikkan == 6) {
                  //print('庚');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanKanoe()),
                  );
                } else if (nikkan == 7) {
                  //print('辛');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanKanoto()),
                  );
                } else if (nikkan == 8) {
                  //print('壬');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanMizunoe()),
                  );
                } else {
                  //print('癸');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NikkanMizunoto()),
                  );
                }

                if (Date2 != null) {
                  // do something
                  //print('$Date2');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
