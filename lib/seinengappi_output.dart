import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'services/admob.dart';

class SeinengappiOutput extends StatelessWidget {
  //final String titleNikkan;
  final String titleSeinengappi;

  SeinengappiOutput({
    Key key,
    //this.titleNikkan,
    this.titleSeinengappi,
  }) : super(key: key);

  //■■　変数初期設定　■■

  final DateTime date0 = DateTime(1900, 1, 1);
  final int nikkan = -1;
  //List<String> nikkanName = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
  final String jukkan = "甲乙丙丁戊己庚辛壬癸"; //十干リスト
  final String jukkanYomi = "甲【きのえ】　乙【きのと】　丙【ひのえ】　丁【ひのと】　戊【つちのえ】"
      "己【つちのと】庚【かのえ】　辛【かのと】　壬【みずのえ】癸【みずのと】"; //十干リスト【よみ】
  final String juunisi = "子丑寅卯辰巳午未申酉戌"; //十二支リスト
  final String jukkanName = null;

  @override
  Widget build(BuildContext context) {
    //■■画面生成のための各種データを生成する■■

    // ■■　生年月日（文字列）を　（DateTime型）に変換する

    //　受けっとった　生年月日をタイトル型から文字列に変換する
    var seinenMoji = titleSeinengappi.substring(0, 4);
    var seigatuMoji = titleSeinengappi.substring(5, 7);
    var seinitiMoji = titleSeinengappi.substring(8, 10);
    var seinengappiMoji = '$seinenMoji-$seigatuMoji-$seinitiMoji';
    //　生年月日を　文字列から　DateTime型　に変換する
    DateTime datetSeinengappi = DateTime.parse(seinengappiMoji); // StringからDate
    //print('$datetSeinengappi');//チェックポイント
    //print('b');

    //　1900.1.1 (甲辰）から誕生日までの日数を算出する
    var nissuu = datetSeinengappi.difference(date0).inDays;
    //  日干を算出する
    var nikkan = nissuu % 10;

    // 十干リスト【よみ】から日干【よみ】を取り出し、空白を削除する
    var jukkanNameYomi =
        jukkanYomi.substring(nikkan * 7, (nikkan + 1) * 7).trimRight();

    //　日支を算出する
    var nissi = (nissuu + 4) % 12;
    print('nissi:$nissi');

    //　日干画面遷移用の文字データを生成する
    var gamenNikkan = '/nikkan$nikkan';

    // 六十干支リストを生成する

    //■■　画面を生成する　■■

    return Scaffold(
      appBar: AppBar(
        title: Text('あなたの日干は'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/チャン_1.jpg'),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('$titleSeinengappi 生まれの'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('あなたの日干は、$jukkanNameYomiです。'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('日干からみた性格'),
                onPressed: () {
                  Navigator.pushNamed(context, gamenNikkan);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('天地徳合の年は、？？？年？？歳の時です'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('干支併臨の年は、？？？年？？歳の時です'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('天地徳合の年とは'),
                onPressed: () {
                  //　天地徳合画面に画面遷移する
                  // Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60, //　縦幅の低い端末はこの値を下げる
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
