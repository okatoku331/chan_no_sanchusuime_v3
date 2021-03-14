import 'package:admob_flutter/admob_flutter.dart';
//import 'package:chan_no_sanchusuimei_v3/nikkan_jump.dart';
//import 'nikkan_jump.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/physics.dart';

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

class InputSeinengappiKekka extends StatelessWidget {
  final String title1;
  InputSeinengappiKekka({Key key, this.title1}) : super(key: key);

  int nikkan = int.parse('title1');
  //DateTime Date0 = DateTime(1900, 1, 1);
  //DateTime Date2;

  //int nissuu = 0;
  //int nikkan = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('あなたの日干は'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/チャン_1.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('title：' '$title1'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('生年月日：' ''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('あなたの日干は:' '$nikkan'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('詳細'),
                onPressed: () {
                  //nissuu = Date2.difference(Date0).inDays;
                  //nikkan = nissuu % 10;

                  //print('$Date0');
                  //print('$Date2');
                  //print('$nissuu');
                  //print('$nikkan');
                  print('$title1');
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
                      MaterialPageRoute(
                          builder: (context) => NikkanTsutinoto()),
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
                  } else if (nikkan == 9) {
                    //print('癸');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NikkanMizunoto()),
                    );
                  } else {}

                  //if (Date2 != null) {
                  // do something
                  //print('$Date2');
                  //}
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.white70,
              child: Text(''),
            ),
            AdmobBanner(
                adUnitId: AdMobService().getBannerAdUnitId(),
                adSize: AdmobBannerSize(
                  width: MediaQuery.of(context).size.width.toInt(),
                  height: AdMobService().getHeight(context).toInt(),
                  name: 'SMART_BANNER',
                )),
          ],
        ),
      ),
    );
  }
}
