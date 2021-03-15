import 'package:admob_flutter/admob_flutter.dart';
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

class InputSeinengappiKekka extends StatelessWidget {
  final String titleNikkan;
  final String titleSeinengappi;

  InputSeinengappiKekka({
    Key key,
    this.titleNikkan,
    this.titleSeinengappi,
  }) : super(key: key);

  //■■　変数初期設定　■■

  int nikkan = 0;
  //List<String> nikkanName = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
  final String jukkan = "甲乙丙丁戊己庚辛壬癸";
  final String jukkanYomi = "甲【きのえ】　乙【きのと】　丙【ひのえ】　丁【ひのと】　戊【つちのえ】"
      "己【つちのと】庚【かのえ】　辛【かのと】　壬【みずのえ】癸【みずのと】"; //十干リスト
  final String jukkanName = null; // 十干
  String jukkanNameYomi = null; // 十干【よみ】
  String seinengappiMoji = null;

  @override
  Widget build(BuildContext context) {
    //■■　受けっとった　生年月日・日干　の文字データから表示文字を生成する　■■

    int nikkan = int.parse(titleNikkan); // 日干の文字データを数字データに変換する
    jukkanNameYomi =
        jukkanYomi.substring(nikkan * 7, (nikkan + 1) * 7).trimRight();
    // 十干リストから日干【よみ】を取り出し、空白を削除する

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
              padding: const EdgeInsets.all(8.0),
              child: Text('$titleSeinengappi 生まれの'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('あなたの日干は、$jukkanNameYomiです。'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('日干からみた性格'),
                onPressed: () {
                  //int nikkan = int.parse(titleNikkan);

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
                  } else {
                    //print('癸');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NikkanMizunoto()),
                    );
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
              height: 190, //　縦幅の低い端末はこの値を下げる
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
