import 'package:admob_flutter/admob_flutter.dart';
import 'input_seinengappi_kekka.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";
import 'services/admob.dart';

class InputSeinengappi extends StatelessWidget {
  final DateTime date0 = DateTime(1900, 1, 1);
  //DateTime date2 = DateTime(1900, 1, 1);
  //int nissuu = 0;
  //int nikkan = 0;

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
                  final date2 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 99),
                    lastDate: DateTime(DateTime.now().year + 30),
                    initialDatePickerMode: DatePickerMode.year,
                    locale: const Locale('ja'),
                  );

                  //■■入力された生年月日のデータを加工する■■

                  var nissuu = date2.difference(date0).inDays;
                  var nikkan = nissuu % 10;

                  String nikkanmoji = nikkan.toRadixString(10);
                  int nikkan1 = int.parse(nikkanmoji);

                  initializeDateFormatting("ja_JP");
                  //var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
                  var seinengappiType =
                      new DateFormat('yyyy．MM．dd（E）', "ja_JP");
                  var seinengappiMoji =
                      seinengappiType.format(date2); // Dateから生年月日の文字
                  var seinenType = new DateFormat('yyyy', "ja_JP");
                  var seinenMoji = seinenType.format(date2); // Dateから生年の文字
                  var seigatuType = new DateFormat('MM', "ja_JP");
                  var seigatuMoji = seigatuType.format(date2); // Dateから生月の文字
                  var seihiType = new DateFormat('dd', "ja_JP");
                  var seihiMoji = seihiType.format(date2); // Dateから生日の文字
                  int seinen = int.parse(seinenMoji);
                  int seigatu = int.parse(seigatuMoji);
                  int seihi = int.parse(seihiMoji);

/*
                  print('a:$date2'); //生年月日のDateTime型
                  print('b:$nikkan'); //日干を表す数字
                  print('c:$nikkanmoji'); //日干を表す文字
                  print('d:$nikkan1');
                  print('e:$seinengappiMoji'); //生年月日を表す文字
                  print('f:$seinenMoji'); //生年を表す文字
                  print('g:$seigatuMoji'); //生月を表す文字
                  print('h:$seihiMoji'); //生日を表す文字
                  print('i:$seinen'); //生年を表す数字
                  print('j:$seigatu'); //生月を表す数字
                  print('k:$seihi'); //生日を表す数字
 */

                  //■■生年月日の表示画面へ画面遷移する

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputSeinengappiKekka(
                        titleNikkan: nikkanmoji,
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
