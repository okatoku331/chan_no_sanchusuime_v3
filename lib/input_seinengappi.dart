import 'package:admob_flutter/admob_flutter.dart';
import 'package:chan_no_sanchusuimei_v3/input_seinengappi_kekka.dart';
//import 'nikkan_jump.dart';
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

class InputSeinengappi extends StatelessWidget {
  DateTime Date0 = DateTime(1900, 1, 1);
  DateTime Date2;
  int nissuu = 0;
  int nikkan = -1;
  String title1 = "次の画面";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生年月日の入力'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/チャン_1.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('生年月日入力'),
                onPressed: () async {
                  final Date2 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 99),
                    lastDate: DateTime(DateTime.now().year + 30),
                    initialDatePickerMode: DatePickerMode.year,
                    locale: const Locale('ja'),
                  );

                  nissuu = Date2.difference(Date0).inDays;
                  nikkan = nissuu % 10;
                  String nikkanmoji = nikkan.toRadixString(10);

                  //print('$Date0');
                  print('a$Date2');
                  //print('$nissuu');
                  print('$nikkan');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InputSeinengappiKekka(title1: nikkanmoji)),
                  );
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NikkanJump(),
                      ));*/
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 240,
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
