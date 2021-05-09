import 'package:admob_flutter/admob_flutter.dart';
import 'package:chan_no_sanchusuimei_v3/output.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'services/admob.dart';

class SeinengappiInput extends StatelessWidget {
  DateTime date9 = DateTime(1957, 3, 1);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var _counter;
    return Scaffold(
      appBar: AppBar(
        title: Text('生年月日の入力'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/hana_sakura.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 4,
                  shadowColor: Colors.red,
                ),
                onPressed: () {
                  //■■生年月日のデータをDateTime型から文字列型に変換する■■
                  initializeDateFormatting("ja_JP");
                  var seinengappiType =
                      new DateFormat('yyyy．MM．dd（E）', "ja_JP");
                  var seinengappiMoji = seinengappiType.format(date9);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Output(
                        titleSeinengappi: seinengappiMoji,
                      ),
                    ),
                  );
                },
                child: Text('上記の生年月日でOK！'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 4,
                  shadowColor: Colors.red,
                ),
                child: Text('生年月日入力'),
                onPressed: () async {
                  final date2 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 99),
                    lastDate: DateTime(DateTime.now().year + 30),
                    initialDatePickerMode: DatePickerMode.year,
                    locale: const Locale('ja'),
                  ); //data2 に　DateTime型で　生年月日が格納される。

                  //■■生年月日のデータをDateTime型から文字列型に変換する■■
                  initializeDateFormatting("ja_JP");
                  var seinengappiType =
                      new DateFormat('yyyy．MM．dd（E）', "ja_JP");
                  var seinengappiMoji = seinengappiType.format(date2);

                  //■■生年月日の表示画面へ画面遷移する
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Output(
                        titleSeinengappi: seinengappiMoji,
                      ),
                    ),
                  );

                  if (date2 != null) {
                    // do something
                    //print('$Date2');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 4,
                  shadowColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('戻る'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 160,
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
