import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'services/admob.dart';

class KyouUnsei extends StatelessWidget {
  final String titleSeinengappi;

  KyouUnsei({
    Key key,
    this.titleSeinengappi,
  }) : super(key: key);

  //■■　変数初期設定　■■
  final DateTime date0 = DateTime(1900, 1, 1);
  final int nikkan = -1;
  //List<String> nikkanName = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
  final String jukkan = "甲乙丙丁戊己庚辛壬癸"; //十干リスト
  final String jukkanYomi = "甲【きのえ】　乙【きのと】　丙【ひのえ】　丁【ひのと】　戊【つちのえ】"
      "己【つちのと】庚【かのえ】　辛【かのと】　壬【みずのえ】癸【みずのと】"; //十干リスト【よみ】
  final String juunisi = "子丑寅卯辰巳午未申酉戌亥"; //十二支リスト
  final String rokujukkansi = "甲子乙丑丙寅丁卯戊辰己巳庚午辛未壬申癸酉"
      "甲戌乙亥丙子丁丑戊寅己卯庚辰辛巳壬午癸未"
      "甲申乙酉丙戌丁亥戊子己丑庚寅辛卯壬辰癸巳"
      "甲午乙未丙申丁酉戊戌己亥庚子辛丑壬寅癸卯"
      "甲辰乙巳丙午丁未戊申己酉庚戌辛亥壬子癸丑"
      "甲寅乙卯丙辰丁巳戊午己未庚申辛酉壬戌癸亥"; //
  final String tuuhenbosi = "比肩劫敗食神傷官偏財正財偏官正官倒食印綬"
      "劫敗比肩傷官食神正財偏財正官偏官印綬倒食"
      "倒食印綬比肩劫敗食神傷官偏財正財偏官正官"
      "印綬倒食劫敗比肩傷官食神正財偏財正官偏官"
      "偏官正官倒食印綬比肩劫敗食神傷官偏財正財"
      "正官偏官印綬倒食劫敗比肩傷官食神正財偏財"
      "偏財正財偏官正官倒食印綬比肩劫敗食神傷官"
      "正財偏財正官偏官印綬倒食劫敗比肩傷官食神"
      "食神傷官偏財正財偏官正官倒食印綬比肩劫敗"
      "傷官食神正財偏財正官偏官印綬倒食劫敗比肩";
  final String jukkanName = null;
  final List nitikansiHeirin = [0, 0, 0, 0, 0, 0];
  final List kansiHeirinList = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    //　変数定義

    //■■画面生成のための各種データを生成する■■

    //　受けっとった　生年月日をタイトル型から文字列に変換する
    var seinenMoji = titleSeinengappi.substring(0, 4);
    var seigatuMoji = titleSeinengappi.substring(5, 7);
    var seinitiMoji = titleSeinengappi.substring(8, 10);
    var seinengappiMoji = '$seinenMoji-$seigatuMoji-$seinitiMoji';
    //　生年月日を　文字列から　DateTime型　に変換する
    DateTime datetSeinengappi = DateTime.parse(seinengappiMoji); // StringからDate
    //　1900.1.1 (甲辰）から誕生日までの日数を算出する
    var nissuu = datetSeinengappi.difference(date0).inDays;
    //  日干を算出する
    var nikkan = nissuu % 10;
    // 十干リスト【よみ】から日干【よみ】を取り出し、空白を削除する
    var jukkanNameYomi =
        jukkanYomi.substring(nikkan * 7, (nikkan + 1) * 7).trimRight();
    //　日支を算出する
    var nissi = (nissuu + 10) % 12;

    //■■　画面を生成する　■■

    return Scaffold(
      appBar: AppBar(
        title: Text('今日の運勢'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('$titleSeinengappi　生まれのあなたの '),
          ),
          ListTile(
            title: Text('　今日の運勢は・・・'),
          ),
          ListTile(
            title: Text(' '),
          ),
          AdmobBanner(
              adUnitId: AdMobService().getBannerAdUnitId(),
              adSize: AdmobBannerSize(
                width: MediaQuery.of(context).size.width.toInt(),
                height: AdMobService().getHeight(context).toInt(),
                name: 'SMART_BANNER',
              )),
          ListTile(
            title: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 90,
              height: 36,
              child: ElevatedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
