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
  final String juunisi = "子丑寅卯辰巳午未申酉戌亥"; //十二支リスト
  final String rokujukkansi = "甲子乙丑丙寅丁卯戊辰己巳庚午辛未壬申癸酉"
      "甲戌乙亥丙子丁丑戊寅己卯庚辰辛巳壬午癸未"
      "甲申乙酉丙戌丁亥戊子己丑庚寅辛卯壬辰癸巳"
      "甲午乙未丙申丁酉戊戌己亥庚子辛丑壬寅癸卯"
      "甲辰乙巳丙午丁未戊申己酉庚戌辛亥壬子癸丑"
      "甲寅乙卯丙辰丁巳戊午己未庚申辛酉壬戌癸亥"; //
  final String jukkanName = null;
  final List nitikansiHeirin = [0, 0, 0, 0, 0, 0];
  final List kansiHeirinList = [0, 0, 0, 0, 0, 0];
  String tenunMeiMoji0 = '干支併臨';
  String tenunMeiMoji1 = '干支併臨';
  String tenunMeiMoji2 = '干支併臨';
  String tenunMeiMoji3 = '干支併臨';
  String tenunMeiMoji4 = '干支併臨';
  int tenunNen3;
  int tenunNen4;
  int tenunNenrei3;
  int tenunNenrei4;

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
    var nissi = (nissuu + 10) % 12;
    //print('nissi:$nissi');

    //　日干画面遷移用の文字データを生成する
    var gamenNikkan = '/nikkan$nikkan';

    // 関数を定義して使う練習(1/2)
    //int cc;
    //int aa = 3;
    //int bb = 4;
    //cc = tasu(aa, bb);
    //print('$cc');

    // 六十干支から干支併臨を算出する
    //日柱の六十干支を算出する
    String nikkanMoji = jukkan.substring(nikkan, nikkan + 1);
    String nissiMoji = juunisi.substring(nissi, nissi + 1);
    String nikkannissiMoji = "$nikkanMoji$nissiMoji";
    // 六十干支リストから日柱の六十干支を検索して、六十干支番号を算出する
    int nitiKansiHeirinSuu = nanmojime(rokujukkansi, nikkannissiMoji);
    // 干支併臨(日)を算出する　1924年は「甲子」
    var nitiKansiHeirin = kansiHeirin(nitiKansiHeirinSuu, seinengappiMoji);
    // 干支併臨(月)を算出する。節入り日時データがないので現時点では算出出来ない。
    var getuKansiHeirin = [0, 0, 0, 0, 0, 0];
    // 干支併臨(年)を算出する
    var nenKansiHeirinSuu = nentyuu(seinengappiMoji);
    var nenKansiHeirin = kansiHeirin(nenKansiHeirinSuu, seinengappiMoji);
    // 天地徳合を算出する
    var tokugouTen = (nikkan + 5) % 10;
    var tokugouTi = (13 - nissi) % 12;
    String tokugouTenMoji = jukkan.substring(tokugouTen, tokugouTen + 1);
    String tokugouTiMoji = juunisi.substring(tokugouTi, tokugouTi + 1);
    String tentiTokugouMoji = '$tokugouTenMoji$tokugouTiMoji';
    int tentiTokugouSuu = nanmojime(rokujukkansi, tentiTokugouMoji);
    var tentiTokugou = kansiHeirin(tentiTokugouSuu, seinengappiMoji);
    // 干支併臨リスト・天地徳合リストから年と年齢を生成する
    List tenunList = tenun(nenKansiHeirin, getuKansiHeirin, nitiKansiHeirin,
        tentiTokugou, seinengappiMoji);
    print('tenunList:$tenunList');
    // 天運リストの要素数を算出する
    int tenunLength = tenunList.length;
    print('tenunLength:$tenunLength');

    int tenun0 = tenunList.removeAt(0);
    print('tenun0:$tenun0');
    print('tenunList:$tenunList');
    var tenunNen0 = tenun0 ~/ 1000;
    var tenunNenrei0 = tenun0 % 1000 ~/ 10;
    var tenunMei0 = tenun0 % 10;
    print('tenunNen0:$tenunNen0');
    print('tenunNenrei0:$tenunNenrei0');
    print('tenunMei:$tenunMei0');
    if (tenunMei0 == 4) {
      String tenunMeiMoji0 = '天地徳合';
    } else {}
    ;
    print('$tenunMeiMoji0');

    int tenun1 = tenunList.removeAt(0);
    print('tenun1:$tenun1');
    print('tenunList:$tenunList');

    var tenunNen1 = tenun1 ~/ 1000;
    var tenunNenrei1 = tenun1 % 1000 ~/ 10;
    var tenunMei1 = tenun1 % 10;
    print('tenunNen1:$tenunNen0');
    print('tenunNenrei1:$tenunNenrei0');
    print('tenunMei1:$tenunMei1');
    if (tenunMei1 == 4) {
      String tenunMeiMoji1 = '天地徳合';
    } else {}
    ;
    print('$tenunMeiMoji0');
    int tenun2 = tenunList.removeAt(0);
    print('tenun2:$tenun2');
    print('tenunList:$tenunList');

    var tenunNen2 = tenun2 ~/ 1000;
    var tenunNenrei2 = tenun2 % 1000 ~/ 10;
    var tenunMei2 = tenun2 % 10;
    print('tenunNen2:$tenunNen0');
    print('tenunNenrei2:$tenunNenrei0');
    print('tenunMei2:$tenunMei2');
    if (tenunMei2 == 4) {
      String tenunMeiMoji2 = '天地徳合';
    } else {}
    ;
    print('$tenunMeiMoji0');
    switch (tenunLength) {
      case (3):
        break;
      case (4):
        int tenun3 = tenunList.removeAt(0);
        print('tenun3:$tenun3');
        print('tenunList:$tenunList');

        var tenunNen3 = tenun3 ~/ 1000;
        var tenunNenrei3 = tenun3 % 1000 ~/ 10;
        var tenunMei3 = tenun3 % 10;
        print('tenunNen3:$tenunNen3');
        print('tenunNenrei3:$tenunNenrei3');
        print('tenunMei3:$tenunMei3');
        if (tenunMei3 == 4) {
          String tenunMeiMoji3 = '天地徳合';
        } else {}
        ;
        print('$tenunMeiMoji3');
        break;
      default:
        int tenun3 = tenunList.removeAt(0);
        print('tenun3:$tenun3');
        print('tenunList:$tenunList');

        var tenunNen3 = tenun3 ~/ 1000;
        var tenunNenrei3 = tenun3 % 1000 ~/ 10;
        var tenunMei3 = tenun3 % 10;
        print('tenunNen3:$tenunNen3');
        print('tenunNenrei3:$tenunNenrei3');
        print('tenunMei3:$tenunMei3');
        if (tenunMei3 == 4) {
          String tenunMeiMoji3 = '天地徳合';
        } else {}
        ;
        print('$tenunMeiMoji0');
        int tenun4 = tenunList.removeAt(0);
        print('tenun4:$tenun4');
        print('tenunList:$tenunList');

        var tenunNen4 = tenun4 ~/ 1000;
        var tenunNenrei4 = tenun4 % 1000 ~/ 10;
        var tenunMei4 = tenun4 % 10;
        print('tenunNen4:$tenunNen4');
        print('tenunNenrei4:$tenunNenrei4');
        print('tenunMei4:$tenunMei4');
        if (tenunMei0 == 4) {
          String tenunMeiMoji4 = '天地徳合';
        } else {}
        ;
        print('$tenunMeiMoji4');

        break;
    }

    //■■　画面を生成する　■■

    return Scaffold(
      appBar: AppBar(
        title: Text('あなたの日干は'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('images/hana_sakura.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('$titleSeinengappi 生まれの'),
                Text('あなたの日干は、$jukkanNameYomiです。'),
                SizedBox(
                  width: 180,
                  height: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      elevation: 4,
                      shadowColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, gamenNikkan);
                    },
                    child: Text('日干からみた性格'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('天運の年は、'),
                Text('$tenunNen0年($tenunNenrei0歳)　$tenunMeiMoji0'),
                Text('$tenunNen1年($tenunNenrei1歳)　$tenunMeiMoji1'),
                Text('$tenunNen2年($tenunNenrei2歳)　$tenunMeiMoji2'),
                Text('$tenunNen3年($tenunNenrei3歳)　$tenunMeiMoji3'),
                Text('$tenunNen4年($tenunNenrei4歳)　$tenunMeiMoji4'),
                SizedBox(
                  width: 180,
                  height: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      elevation: 4,
                      shadowColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/nikkan0');
                    },
                    child: Text('天地徳合とは'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 90,
              height: 36,
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
          ),
          Container(
            width: double.infinity,
            height: 40, //　縦幅の低い端末はこの値を下げる
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
    );
  }
}

// 関数を定義して使う練習（2/2）
//int tasu(int a, int b) {
//  var c = a + b;
//  return c;
//}

// 関数定義　文字列リストから検索文字列が先頭から何文字目にあるか返す
//  c = nanmojime(a,b)
//  a:　120文字（2文字×60組）の文字列リスト
//  b:　2文字の検索文字
//  c:　-2：一致が2組以上ある
//      -1:一致する組がない
//      0 ～ 59 : 組めに1組だけある
int nanmojime(String mojilist, String kensaku2moji) {
  int nanbanme = -1;
  int ittisuu = 0;
  for (int i = 0; i < 60; i++) {
    String nimoji = mojilist.substring(i * 2, i * 2 + 2);
    if (nimoji == kensaku2moji) {
      nanbanme = i;
      ittisuu = ittisuu + 1;
    } else {}
  }
  if (ittisuu > 1) {
    nanbanme = -2;
  } else if (ittisuu < 1) {
    nanbanme = -1;
  } else {}
  return nanbanme;
}

// 関数定義　干支から対応する西暦年と年齢を99歳までの間で算出する
//   c = kannsiHeirin(a,b)
//   a: 干支No.を表す0～59の数字　（　0:甲子　1:乙丑　～　58:壬戌　59:癸亥　）
//   b: 生年月日を表す文字列　（yyyy-MM-dd）
//   c: 干支併臨の年を表す 数字の配列（　[0,0,1961,2021,0] )
//
List kansiHeirin(int kansiSuu, String seinengappiMojiretu) {
  List kansiHeirinList = [];
  // 生年月日（文字列）を　（DateTime型）に変換する
  DateTime date3 = DateTime.parse(seinengappiMojiretu); // StringからDate
  //print('$date3'); //チェックポイント
  //print('a');
  int seinen = int.parse(seinengappiMojiretu.substring(0, 4));
  DateTime date4 = DateTime(seinen, 2, 4);
  //　1900.1.1 (甲辰）から誕生日までの日数を算出する
  var nissuu = date3.difference(date4).inDays;
  if (nissuu < 0) {
    --seinen;
  }
  //print('seinen:$seinen');
  //print('b');
  int nen = 0;
  for (int i = 0; i < 6; ++i) {
    nen = 1864 + 60 * i + kansiSuu;
    if (nen <= seinen) {
      kansiHeirinList.add(0);
    } else if (nen > seinen + 100) {
      kansiHeirinList.add(0);
    } else {
      kansiHeirinList.add(nen);
    }
    //print('Cloned lista: $kansiHeirinList');
  }
  //print('Cloned listb: $kansiHeirinList');
  return kansiHeirinList;
}

// 関数定義　生年月日から　年柱の六十干支を算出する
//  b = nentyuu(a)
//   a: 生年月日を表す文字列　（yyyy-MM-dd）
//   b: 年柱の六十干支を表す数字　（0～59）（例　0:　甲子）
//
int nentyuu(String a) {
  // 生年月日（文字列）を　（DateTime型）に変換する
  DateTime date3 = DateTime.parse(a); // StringからDate
  int seinen = int.parse(a.substring(0, 4));
  DateTime date4 = DateTime(seinen, 2, 4);
  //　1900.1.1 (甲辰）から誕生日までの日数を算出する
  var nissuu = date3.difference(date4).inDays;
  if (nissuu < 0) {
    --seinen;
  }
  var kansiSui = (seinen - 1924) % 60;
  print('seinen:$seinen');
  print('nnentyu');
  print('kansiSui:$kansiSui');
  return kansiSui;
}

// 関数定義　天運到来の西暦とその時を迎える満年齢と種類を西暦昇順に並べる配列を生成する
//  f = tenun(a,b,c,d,e)
//  a: 干支併臨（年）の年を表す 数字の配列（　[0,0,0,2017,0] )
//  b: 干支併臨（月）の年を表す 数字の配列（　[0,0,0,0,0] )
//  c: 干支併臨（日）の年を表す 数字の配列（　[0,0,1962,2022,0] )
//  d: 天地徳合　　　の年を表す 数字の配列（　[0,0,0,2007,0] )
//  e: 生年月日を表す文字列　（yyyy-MM-dd）
//　f: 天運到来の年yyyy立春時の満年齢GG種類nを表す数字配列
//              [yyyyGGn]  n: 1: 干支併臨（年柱）
//                            2: 干支併臨 (月柱）
//                            3: 干支併臨 (日柱）
//                            4: 天地徳合
//          例　[1962053,1963062,2007504,2017601,2022653,2023662]
//
List tenun(List a, List b, List c, List d, String e) {
  List tenunList = [];
  List<int> tenunNen = [];
  int nen = 0;
  // 生年月日（文字列）を　（DateTime型）に変換する
  DateTime date3 = DateTime.parse(e); // StringからDate

  print('a:$a');
  print('b:$b');
  print('c:$c');
  print('d:$d');

  int nenrei;
  int tenunMei;
  int tenunDate;
  List nenList = [];
  // 年柱
  nenList = a;
  tenunMei = 1;
  for (int i = 0; i < 6; ++i) {
    nen = nenList.removeAt(0);
    if (nen != 0) {
      DateTime date4 = DateTime(nen, 2, 4);
      var nissuu = date4.difference(date3).inDays;
      var nenrei = nissuu ~/ 365;
      var tenunDate = nen * 1000 + nenrei * 10 + tenunMei;
      tenunNen.add(tenunDate);
    } else {}
    ;
  }
  print('tenunNen:$tenunNen');
  // 月柱
  nenList = b;
  tenunMei = 2;
  for (int i = 0; i < 6; ++i) {
    nen = nenList.removeAt(0);
    if (nen != 0) {
      DateTime date4 = DateTime(nen, 2, 4);
      var nissuu = date4.difference(date3).inDays;
      var nenrei = nissuu ~/ 365;
      var tenunDate = nen * 1000 + nenrei * 10 + tenunMei;
      tenunNen.add(tenunDate);
    } else {}
    ;
  }
  print('tenunNen:$tenunNen');
  // 日柱
  nenList = c;
  tenunMei = 3;
  for (int i = 0; i < 6; ++i) {
    nen = nenList.removeAt(0);
    if (nen != 0) {
      DateTime date4 = DateTime(nen, 2, 4);
      var nissuu = date4.difference(date3).inDays;
      var nenrei = nissuu ~/ 365;
      var tenunDate = nen * 1000 + nenrei * 10 + tenunMei;
      tenunNen.add(tenunDate);
    } else {}
    ;
  }
  print('tenunNen:$tenunNen');
  // 天地徳合
  nenList = d;
  tenunMei = 4;
  for (int i = 0; i < 6; ++i) {
    nen = nenList.removeAt(0);
    if (nen != 0) {
      DateTime date4 = DateTime(nen, 2, 4);
      var nissuu = date4.difference(date3).inDays;
      var nenrei = nissuu ~/ 365;
      var tenunDate = nen * 1000 + nenrei * 10 + tenunMei;
      tenunNen.add(tenunDate);
    } else {}
    ;
  }
  print('tenunNen:$tenunNen');
  // 西暦昇順にソートする
  tenunNen.sort((num1, num2) => num1 - num2);
  print('tenunNen:$tenunNen');
  return tenunNen;
}

// 六十干支リストを生成する　（String rokujukkansi　の文字列をつくるため）
//String rokujuuKansi = '';
//for (int i = 0; i < 60; i++) {
//  var j = i % 10;
//  var k = i % 12;
//  var kan = jukkan.substring(j, j + 1);
//  var si = juunisi.substring(k, k + 1);
//  rokujuuKansi = rokujuuKansi + kan + si;
//  print('$i');
//  print('$j');
//  print('$k');
//  print('$rokujuuKansi');
//};
