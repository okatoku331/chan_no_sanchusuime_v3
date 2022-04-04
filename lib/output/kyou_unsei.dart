import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final String gogyou = "木＋木ー火＋火ー土＋土ー金＋金ー水＋水ー"; // 五行リスト
  final String juunisi = "子丑寅卯辰巳午未申酉戌亥"; //十二支リスト
  final String juunisiMoji = "0123456789ab"; //十二支数リスト
  final String juunisiYomi = "ね　　うし　とら　う　　たつ　み　　うま　ひつじさる　とり　いぬ　い　　";
  final String rokujukkansi = "甲子乙丑丙寅丁卯戊辰己巳庚午辛未壬申癸酉"
      "甲戌乙亥丙子丁丑戊寅己卯庚辰辛巳壬午癸未"
      "甲申乙酉丙戌丁亥戊子己丑庚寅辛卯壬辰癸巳"
      "甲午乙未丙申丁酉戊戌己亥庚子辛丑壬寅癸卯"
      "甲辰乙巳丙午丁未戊申己酉庚戌辛亥壬子癸丑"
      "甲寅乙卯丙辰丁巳戊午己未庚申辛酉壬戌癸亥"; //
  final String tuuhenbosiKanji = "比肩劫敗食神傷官偏財正財偏官正官倒食印綬";
  final String tuuhenbosiYomi =
      "ひけん　　ごうはい　しょくしんしょうかんへんざい　せいざい　へんがん　せいがん　とうしょくいんじゅ　";
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
  final String tuuhenbosizu = "00010203040506070809"
      "01000302050407060908"
      "18191011121314151617"
      "19181110131215141716"
      "26272829202122232425"
      "27262928212023222524"
      "34353637383930313233"
      "35343736393831303332"
      "42434445464748494041"
      "43424544474649484140";
  final String kangou = "　　　　　合　　　　"
      "　　　　　　合　　　"
      "　　　　　　　合　　"
      "　　　　　　　　合　"
      "　　　　　　　　　合"
      "合　　　　　　　　　"
      "　合　　　　　　　　"
      "　　合　　　　　　　"
      "　　　合　　　　　　"
      "　　　　合　　　　　";
  /*final String sigouZu =
      "000102030405060708090a0b"
      "101112131415161718191a1b"
      "202122232425262728292a2b"
      "303132333435363738393a3b"
      "404142434445464748494a4b"
      "505152535455565758595a5b"
      "606162636465666768696a6b"
      "707172737475767778797a7b"
      "808182838485868788898a8b"
      "909192939495969798999a9b"
      "a0a1a2a3a4a5a6a7a8a9aaab"
      "b0b1b2b3b4b5b6b7b8b9babb";*/
  /*final String sigou =
      "　合　　三　冲害三　　　"
      "合　　　　三害冲　三　　"
      "　　　　　害三　冲　三合"
      "　　　　害　　三　冲合三"
      "三　　害　　　　三合冲　"
      "　三害　　　　　合三　冲"
      "冲害三　　　　合　　三　"
      "害冲　三　　合　　　　三"
      "三　冲　三合　　　　　害"
      "　三　冲合三　　　　害　"
      "　　三合冲　三　　害　　"
      "　　合三　冲　三害　　　";*/
  final String sigouKei = "　合　刑三　冲害三　　　"
      "合　　　　三害一　三刑　"
      "　　　　　二三　一　三合"
      "刑　　　五　　三　冲合三"
      "三　　五　　　　三合冲　"
      "　三二　　　　　四三　冲"
      "冲害三　　　　合　　三　"
      "害一　三　　合　　　刑三"
      "三　一　三四　　　　　害"
      "　三　冲合三　　　　害　"
      "　刑三合冲　三刑　害　　"
      "　　合三　冲　三害　　　";
  /*final String sikei =
      "　　　刑　　　　　　　　"
      "　　　　　　　刑　　刑　"
      "　　　　　刑　　刑　　　"
      "刑　　　　　　　　　　　"
      "　　　　　　　　　　　　"
      "　　刑　　　　　刑　　　"
      "　　　　　　　　　　　　"
      "　刑　　　　　　　　刑　"
      "　　刑　　刑　　　　　　"
      "　　　　　　　　　　　　"
      "　刑　　　　　刑　　　　"
      "　　　　　　　　　　　　";*/
  final String jukkanName = null;
  final List nitikansiHeirin = [0, 0, 0, 0, 0, 0];
  final List kansiHeirinList = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    //　変数定義
    String kangouMoji1 = '';
    String kangouMoji2 = '';
    String kangouMoji3 = '';
    String sigouMoji = '';
    //String sikeiMoji = '';
    String sigouKaisetu = '';
    //String tuuhenbosiNowKaisetu = '';
    List<String> moji = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      ''
    ];
    List<String> zu = [
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg',
      'images/0.jpg'
    ];
    List<double> takasaMoji = [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0
    ];
    List<double> takasaZu = [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0
    ];
    //白：-1 ,ピンク：-1407770
    final int iroPink1 = -140770;
    List<int> iroMoji = [
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    ];

    String nikkanInYou = '';
    String kitiKyou = '平';
    String kitiPlus = 'プラスマイナス';
    int kitiP = 0;
    int kitiPoint = 0;
    int kitiPointNikann = 0;
    int kitiPointNissi = 0;
    int kitiPointKangou = 0;

    //■■画面生成のための各種データを生成する■■

    //　受けっとった　生年月日をタイトル型から文字列に変換する
    var seinenMoji = titleSeinengappi.substring(0, 4);
    var seigatuMoji = titleSeinengappi.substring(5, 7);
    var seinitiMoji = titleSeinengappi.substring(8, 10);
    var seinengappiMoji = '$seinenMoji-$seigatuMoji-$seinitiMoji';
    //　生年月日を　文字列から　DateTime型　に変換する
    DateTime datetSeinengappi = DateTime.parse(seinengappiMoji); // StringからDate
    //　今日の日付を取得する
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy.MM.dd');
    String dateNow = outputFormat.format(now);
    //print(dateNow);
    //　1900.1.1 (甲辰）から今日までの日数を算出する
    var nissuuNow = now.difference(date0).inDays;
    //  今日の日干を算出する
    var nikkanNow = nissuuNow % 10;
    var jukkanNow = jukkan.substring(nikkanNow, nikkanNow + 1);
    //　今日の五行を算出する
    var gogyouNow = gogyou.substring(nikkanNow * 2, nikkanNow * 2 + 2);

    //　1900.1.1 (甲辰）から誕生日までの日数を算出する
    var nissuu = datetSeinengappi.difference(date0).inDays;
    //  日干を算出する
    var nikkan = nissuu % 10;
    var jukkanMoji = jukkan.substring(nikkan, nikkan + 1);
    //　五行を算出する
    var gogyouMoji = gogyou.substring(nikkan * 2, nikkan * 2 + 2);
    var nikkanYouIn = gogyou.substring(nikkan * 2 + 1, nikkan * 2 + 2);
    if (nikkanYouIn == '＋') {
      nikkanInYou = 'ー';
    } else {
      nikkanInYou = '＋';
    }

    //　今日の通変星を算出する
    var tuuhenbosiNow = tuuhenbosi.substring(
        nikkan * 20 + nikkanNow * 2, nikkan * 20 + nikkanNow * 2 + 2);

    //　今日の通変星図を算出する
    var tuuhendosizuNow = tuuhenbosizu.substring(
        nikkan * 20 + nikkanNow * 2, nikkan * 20 + nikkanNow * 2 + 2);

    //　今日の通変星のふりがなを算出する
    var tuuhenbosiSuu = nanmojimea(tuuhenbosiKanji, tuuhenbosiNow, 10);
    var tuuhenbosiYomiNow = tuuhenbosiYomi
        .substring(tuuhenbosiSuu * 5, tuuhenbosiSuu * 5 + 5)
        .trimRight();

    // 説明文１
    moji[0] = '　今日（$dateNow）の運勢は・・・';
    moji[1] = '１．「日干」からみた今日の運勢';
    moji[2] = '　生年月日の日干：$jukkanMoji（$gogyouMoji）';
    moji[3] = '　　　今日の日干：$jukkanNow（$gogyouNow）';
    moji[4] = '　　今日の通変星：$tuuhenbosiNow（$tuuhenbosiYomiNow）';
    moji[5] = '　図で表すと下図のようになります。';
    moji[6] = '　　薄い灰色の円のすぐ内側が（$nikkanYouIn）、';
    moji[7] = '　　　　　　さらにその内側が（$nikkanInYou）';
    moji[8] = '　　を表しています。';

    zu[5] = 'images/tuuhenbosi/$tuuhendosizuNow.jpg';

    takasaMoji[0] = 25.0;
    takasaMoji[1] = 25.0;
    takasaMoji[2] = 25.0;
    takasaMoji[3] = 25.0;
    takasaMoji[4] = 25.0;
    takasaMoji[5] = 50.0;
    takasaMoji[6] = 25.0;
    takasaMoji[7] = 25.0;
    takasaMoji[8] = 25.0;

    takasaZu[5] = 250.0;

    //　通変星の解説文作成
    if (tuuhenbosiNow == '比肩') {
      moji[9] = '比肩　の持つ意味は、';
      moji[10] = '　①意志と信念の星';
      moji[11] = '　②独立と改革の星';
      moji[12] = '　③出費の星';
      moji[13] = '　④妻・女性を刻する星';
      moji[14] = '　⑤ライバルの星';
      moji[15] = '　⑥自己中心の星';
      moji[16] = '　⑦弁が立つ口の星';
      moji[17] = '　⑧大胆な星';
      moji[18] = '　⑨孤独な星';
      moji[19] = '■吉ポイントは、プラスマイナス０です。';
      takasaMoji[9] = 28.0;
      takasaMoji[10] = 28.0;
      takasaMoji[11] = 28.0;
      takasaMoji[12] = 28.0;
      takasaMoji[13] = 28.0;
      takasaMoji[14] = 28.0;
      takasaMoji[15] = 28.0;
      takasaMoji[16] = 28.0;
      takasaMoji[17] = 28.0;
      takasaMoji[18] = 28.0;
      takasaMoji[19] = 28.0;
      iroMoji[19] = iroPink1;
      kitiPointNikann = 0;
    } else if (tuuhenbosiNow == '劫敗') {
      moji[9] = '劫敗　の持つ意味は、';
      moji[10] = '　①意志と信念の星';
      moji[11] = '　②独立と改革の星';
      moji[12] = '　③出費の星';
      moji[13] = '　④妻・女性を刻する星';
      moji[14] = '　⑤ライバルの星';
      moji[15] = '　⑥自己中心の星';
      moji[16] = '　⑦弁が立つ口の星';
      moji[17] = '　⑧大胆な星';
      moji[18] = '　⑨孤独な星';
      moji[19] = '■吉ポイントは、マイナス10です。';
      takasaMoji[9] = 28.0;
      takasaMoji[10] = 28.0;
      takasaMoji[11] = 28.0;
      takasaMoji[12] = 28.0;
      takasaMoji[13] = 28.0;
      takasaMoji[14] = 28.0;
      takasaMoji[15] = 28.0;
      takasaMoji[16] = 28.0;
      takasaMoji[17] = 28.0;
      takasaMoji[18] = 28.0;
      takasaMoji[19] = 28.0;
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '食神') {
      moji[9] = '食神　の日は、次の星が巡ってきます。';
      moji[10] = '①感のよい星';
      moji[11] = '②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）';
      moji[15] = '③一言多い口の星（実際は半言多い程度）';
      moji[17] = '④正義感が強い星';
      moji[18] = '⑤せっかちで慌て者の星';
      moji[19] = '⑥プライドの星';
      moji[20] = '⑦寿星（功労の星　神がつくのはこの星だけ）';
      moji[22] = '⑧衣食に恵まれる星（食べること着ることが大好き）';
      moji[23] = '⑨明るく聡明な星';
      moji[24] = '⑩恥ずかしがりやな星';
      moji[26] = '⑪健康的な色星';
      moji[27] = '⑫財星を生じ財星を助ける星';
      moji[28] = '⑬吉星なのでポロッと白状してしまう星';
      moji[29] = '⑭笑顔とユーモアで口で人を傷つけない吉星';
      moji[30] = '■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '傷官') {
      moji[9] = '傷官　の持つ意味は,';
      moji[10] = '①感のよい星';
      moji[11] = '②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）';
      moji[14] = '③一言多い口の星（実際は二言三言多い）';
      moji[15] = '④正義感が強い星';
      moji[16] = '⑤せっかちで慌て者の星';
      moji[17] = '⑥特にプライドの高い星';
      moji[18] = '⑦個性の強い星';
      moji[19] = '⑧譲らない信念の星';
      moji[20] = '⑨こだわって生きている星';
      moji[21] = '⑩約束の変更を嫌がる星';
      moji[22] = '⑪相手に対して要求が強い星';
      moji[23] = '⑫体を張って生命をかける星';
      moji[24] = '⑬失敗を素直に認めず、すみませんと言えない星';
      moji[25] = '⑭人から命令されたり頭を抑えつけられたりするのが大嫌いな星';
      moji[26] = '⑮やるなと言われればやりたくなる星';
      moji[27] = '⑯夫が悪いことをしていないかチェックする星';
      moji[28] = '⑰凶星なのでアリバイ作りがうまく、悪知恵も働きボロを出さず白状しない星';
      moji[29] = '⑱逃げ場が無いほど口で人を傷つける凶星';
      moji[30] = '■吉ポイントは、マイナス10です。';
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '偏財') {
      moji[9] = '偏財　の持つ意味は、';
      moji[10] = '①商売・営業の星';
      moji[11] = '②人に好かれる星';
      moji[12] = '③交際上手な星';
      moji[13] = '④話上手な星（「奥さん、奥さん」と言ってさっと懐に入る、アメ横でバナナの叩き売りをするイメージ）';
      moji[16] = '⑤Noと言えない星';
      moji[17] = '⑥駆け引き上手な星';
      moji[18] = '⑦金に縁のある星';
      moji[19] = '⑧口先だけでボロ儲けする星';
      moji[20] = '⑨流通に関する商売';
      moji[21] = '⑩ボーナスのように金が大きく入るが大きく出ていく星';
      moji[22] = '■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '正財') {
      moji[9] = '正財　の持つ意味は、';
      moji[10] = '①商売・営業の星';
      moji[11] = '②人に好かれる星';
      moji[12] = '③交際上手な星（「奥様、奥様」と言って松坂屋で高級服や貴金属を売る上品なイメージ）';
      moji[15] = '④話上手な星';
      moji[16] = '⑤Noと言えない星';
      moji[17] = '⑥駆け引き上手な星';
      moji[18] = '⑦金に縁のある星';
      moji[19] = '⑧コツコツ汗水流して得る確実な収入';
      moji[20] = '⑨給料のように決められた金が確実に入り無茶な金遣いを好まない星';
      moji[21] = '■吉ポイントは、プラス10です。';
      takasaMoji[9] = 25.0;
      takasaMoji[10] = 25.0;
      takasaMoji[11] = 25.0;
      takasaMoji[12] = 25.0;
      takasaMoji[15] = 25.0;
      takasaMoji[16] = 25.0;
      takasaMoji[17] = 25.0;
      takasaMoji[18] = 25.0;
      takasaMoji[19] = 25.0;
      takasaMoji[20] = 25.0;
      takasaMoji[21] = 25.0;
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '偏官') {
      moji[9] = '偏官　の持つ意味は、';
      moji[10] = '①人間にとって最も重要な日干（自分の肉体）を激しく刻する星（偏官は殺と言われる、健康に注意すること）';
      moji[15] = '②女性にとっては官星は男性・異性運を表す（遊び、恋愛、若いツバメ、再婚）';
      moji[17] = '③活発で行動力があり、動き回る星';
      moji[18] = '④笑顔もなく、ひきつった顔で動き回る';
      moji[19] = '⑤星気も短く、落ち着きにかける星（仕事や付き合いで動き回り帰りが遅い）';
      moji[22] = '■吉ポイントは、マイナス10です。';
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '正官') {
      moji[9] = '正官　の持つ意味は、';
      moji[10] = '①誠実、真面目、品格、正直、温厚、品行方正な星';
      moji[11] = '②上流社会に住む人のイメージで、良いとこのお坊ちゃんお嬢ちゃん';
      moji[12] = '③一つの与えられた仕事をきちんとする四角四面の人';
      moji[13] = '④面白みのない要領の悪い人';
      moji[14] = '⑤地位、名誉、肩書きの星（地位を得やすい）';
      moji[15] = '■吉ポイントは、プラス10です。';

      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '倒食') {
      moji[9] = '倒食　の持つ意味は、';
      moji[10] = '①人気運の星　（人当たりがよく、ユーモアのある楽しい星）';
      moji[12] = '②明るく融通性があり調子の良い星';
      moji[13] = '③バタバタと忙しい星（サザエさんのような星、返事はよいがわかっていない、気ばかり先にいって肝心な所を見落とす）';
      moji[16] = '④飽きっぽく忘れやすい星（あれもこれもそれもする人、奥がなく一つを極めること）';
      moji[17] = '⑤趣味、副業の星';
      moji[18] = '⑥福分の星、衣食に困らない星';
      moji[19] = '⑦人の世話や厄介事を引き受ける星';
      moji[20] = '⑧名誉の星';
      moji[21] = '⑨文化、芸術、学術、宗教の星（日干を強め栄養を送る星）';
      moji[23] = '（印星からの栄養は親の愛であり、目に見えない精神的な栄養をあらわす。';
      moji[24] = '　この印星によって人は救われるので、困ったときの助けの神となる。';
      moji[25] = '　困った時に立ち直れる人とは、';
      moji[26] = '　　ⅰ）良きアドバイザーを持つこと・・親、先生、師匠、、コーチ、学術';
      moji[27] = '　　ⅱ）良き趣味を持つこと・・・文化、芸術';
      moji[28] = '　　ⅲ）神に助けてもらうこと・・宗教';
      moji[29] = '⑩人助けの星、ボランティアの星';
      moji[30] = '■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '印綬') {
      moji[9] = '印綬　の持つ意味は、';
      moji[10] = '①名誉の星';
      moji[11] = '②文化、芸術、学術、宗教の星（日干を強め栄養を送る星）';
      moji[13] = '（印星からの栄養は親の愛であり、目に見えない精神的な栄養をあらわす。';
      moji[15] = 'この印星によって人は救われるので、困ったときの助けの神となる。';
      moji[16] = '困った時に立ち直れる人とは、';
      moji[17] = 'ⅰ）良きアドバイザーを持つこと・・親、先生、師匠、、コーチ、学術';
      moji[19] = 'ⅱ）良き趣味を持つこと・・・文化、芸術';
      moji[20] = 'ⅲ）神に助けてもらうこと・・宗教';
      moji[21] = '③人助けの星、ボランティアの星';
      moji[22] = '■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    }

    //　干合を算出する
    var kangouNow = kangou.substring(
        nikkan * 10 + nikkanNow * 1, nikkan * 10 + nikkanNow * 1 + 1);
    if (kangouNow == '合') {
      moji[31] = '干合(かんごう）があります。';
      moji[32] = '干合は、男（＋）と女（ー）の発想の違うカップルが'
          '一緒になると新しいエネルギーが生じ、さらに変化したエネルギーも生じるという意味があります。';
      moji[33] = '　■吉ポイントは、プラス20です。';
      takasaMoji[31] = 25.0;
      takasaMoji[32] = 100.0;
      kitiPointKangou = 20;
    } else {}

    //　今日の日支を算出する
    var nissiNow = (nissuuNow + 10) % 12;
    var nissiNowMoji = juunisi.substring(nissiNow, nissiNow + 1);
    var juunisiaNow = juunisiMoji.substring(nissiNow, nissiNow + 1);

    //　日支を算出する
    var nissi = (nissuu + 10) % 12;
    var nissiMoji = juunisi.substring(nissi, nissi + 1);
    var juunisia = juunisiMoji.substring(nissi, nissi + 1);

    //  支合・支冲等関係図を算出する
    // 解説２
    moji[36] = '２．「日支」からみた今日の運勢';
    moji[37] = '　生年月日の日支：$nissiMoji';
    moji[38] = '　　　今日の日支：$nissiNowMoji';
    moji[39] = '　その関係性を表したのが、下図になります。ピンクの矢印がさす部分が今日の運勢です。';

    zu[39] = 'images/sigou/s$juunisia$juunisiaNow.jpg';

    //　支合を算出する
    var sigouNow = sigouKei.substring(
        nissi * 12 + nissiNow * 1, nissi * 12 + nissiNow * 1 + 1);
    if (sigouNow == '合') {
      moji[40] = '支合（しごう）があります';
      moji[41] = '支合の意味は、仲のいい恋人夫婦の大きな気が発生します。'
          '大吉です。■吉ポイントは、プラス20です。';
      kitiPointNissi = 20;
    } else if (sigouNow == '三') {
      moji[40] = '三合（さんごう）があります';
      moji[41] = '三合の意味は、女子学生三人組のような関係で、'
          '一人一人は弱くても三人そろうと大きな気を発生します。二人そろった半会（はんかい）でもそれなりの気を発生します。'
          '吉です。■吉ポイントは、プラス10です。';
      kitiPointNissi = 10;
    } else if (sigouNow == '冲') {
      moji[40] = '冲（ちゅう）があります';
      moji[41] = '冲は、同性同士の殴り合いを意味します。'
          '同性同士なので、激しく殴り合ったり、ひっかきあったり、気をうばわれます。'
          '大凶です。■吉ポイントは、マイナス20です。';
      kitiPointNissi = -20;
    } else if (sigouNow == '害') {
      moji[40] = '害（がい）があります';
      moji[41] = '害は、トラブルを意味します。冲（ちゅう）に比べれば軽く、激しい喧嘩しませんが、トラブルなので気はやはりうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。';
      kitiPointNissi = -10;
    } else if (sigouNow == '刑') {
      moji[40] = '刑（けい）があります';
      moji[41] = '刑は、トラブルを意味します。冲（ちゅう）に比べれば軽く、激しい喧嘩しませんが、トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。';
      kitiPointNissi = -10;
    } else if (sigouNow == '一') {
      moji[40] = '冲（ちゅう）と刑（けい）があります';
      moji[41] = '悪い作用が重なるのではなく、あるときは冲になり、あるときは刑になります。冲は、同性同士の殴り合いを意味します。'
          '刑は冲に比べれば軽く、激しい喧嘩しませんが、トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス15です。　';
      kitiPointNissi = -15;
    } else if (sigouNow == '二') {
      moji[40] = '害（がい）と刑（けい）があります';
      moji[41] = '悪い作用が重なるのではなく、あるときは害になり、あるときは刑になります。'
          '刑は重いトラブル、害は軽いトラブルを意味します。トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。　';
      kitiPointNissi = -10;
    } else if (sigouNow == '四') {
      moji[40] = '支合（しごう）と刑（けい）があります';
      moji[41] = '良い作用の支合と悪い作用の刑が重なります。普段は仲のいい夫婦が急に大げんかするようなような意味です。'
          '仲がいいときは気を発生しますが、喧嘩して気がうばわれます。'
          '吉です。■吉ポイントは、プラス10です。　';
      kitiPointNissi = 10;
    } else if (sigouNow == '五') {
      moji[40] = '卯辰の害があります';
      moji[41] = '害（がい）は、トラブルを意味しますが、卯辰の害は、冲（ちゅう）のなぐりあいに匹敵する喧嘩を意味します。'
          '夫婦の激しい喧嘩の意味です。気は激しくうばわれます。'
          '中凶です。■吉ポイントは、マイナス15です。';
      kitiPointNissi = -15;
    } else {
      moji[40] = '支合・三合・冲・害・刑はありません';
      moji[41] = '■吉ポイントは、プラスマイナス０です。';
      kitiPointNissi = 0;
    }

    //吉凶ポイント算出
    kitiPoint = kitiPointNikann + kitiPointNissi + kitiPointKangou;
    if (kitiPoint > 24) {
      kitiKyou = '大吉';
      kitiPlus = 'プラス';
      kitiP = kitiPoint;
    } else if (kitiPoint > 14) {
      kitiKyou = '中吉';
      kitiPlus = 'プラス';
      kitiP = kitiPoint;
    } else if (kitiPoint > 4) {
      kitiKyou = '小吉';
      kitiPlus = 'プラス';
      kitiP = kitiPoint;
    } else if (kitiPoint > -5) {
      kitiKyou = '平';
      kitiPlus = 'プラスマイナス';
      kitiP = 0;
    } else if (kitiPoint > -15) {
      kitiKyou = '小凶';
      kitiPlus = 'マイナス';
      kitiP = kitiPoint * -1;
    } else if (kitiPoint > -25) {
      kitiKyou = '中凶';
      kitiPlus = 'マイナス';
      kitiP = kitiPoint * -1;
    } else {
      kitiKyou = '大凶';
      kitiPlus = 'マイナス';
      kitiP = kitiPoint * -1;
    }

    // 解説３
    moji[42] = '３．総合ポイント';
    moji[43] = '日干：';
    moji[44] = '干合：';
    moji[45] = '日支：';
    moji[46] = '総合；　$kitiPlus$kitiPoint';
    moji[49] = '$kitiKyou';

    //■■　画面を生成する　■■

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '今日の運勢 ($titleSeinengappi 生) ',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            //height: 400,
            child: ListView.builder(
              itemCount: 50,
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
            ),
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

          Container(
            height: 0,
          ),

          //バナー広告追加
          //if (banner == null)
          SizedBox(
            height: 0,
            child: Container(
              color: Colors.black,
            ),
          ), // Ads
          //else
          // SizedBox(
          //   height: 50,
          //  child: AdWidget(ad: banner),
          // ),

          //バナー広告ここまで

          Container(
            height: 0,
          ),
        ],
      ),
    );
  }
}

// 関数定義　文字列リストから検索文字列が先頭から何文字目にあるか返す
//  c = nanmojime(a,b,d)
//  a:　120文字（2文字×60組）の文字列リスト
//  b:　2文字の検索文字
//  d: 要素数
//  c:　-2：一致が2組以上ある
//      -1:一致する組がない
//      0 ～ 59 : 組めに1組だけある
int nanmojimea(String mojilist, String kensaku2moji, int yousosuu) {
  int nanbanme = -1;
  int ittisuu = 0;
  for (int i = 0; i < yousosuu; i++) {
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
