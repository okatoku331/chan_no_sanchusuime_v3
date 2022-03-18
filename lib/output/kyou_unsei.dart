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
    String kangouMoji = '';
    String sigouMoji = '';
    //String sikeiMoji = '';
    String sigouKaisetu = '';
    String tuuhenbosiNowKaisetu = '';
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

    //　通変星の解説文作成
    if (tuuhenbosiNow == '比肩') {
      tuuhenbosiNowKaisetu = '比肩　の持つ意味は、'
          '①意志と信念の星　②独立と改革の星　③出費の星　④妻・女性を刻する星　'
          '⑤ライバルの星　⑥自己中心の星　⑦弁が立つ口の星　⑧大胆な星　⑨孤独な星'
          '　　■吉ポイントは、プラスマイナス０です。';
      kitiPointNikann = 0;
    } else if (tuuhenbosiNow == '劫敗') {
      tuuhenbosiNowKaisetu = '劫敗　の持つ意味は、'
          '①意志と信念の星　②独立と改革の星　③出費の星　④妻・女性を刻する星　'
          '⑤ライバルの星　⑥自己中心の星　⑦弁が立つ口の星　⑧大胆な星　⑨孤独な星'
          '　　■吉ポイントは、マイナス10です。';
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '食神') {
      tuuhenbosiNowKaisetu = '食神　の持つ意味は、'
          '①感のよい星　'
          '②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）　'
          '③一言多い口の星（実際は半言多い程度）　④正義感が強い星'
          '⑤せっかちで慌て者の星　⑥プライドの星'
          '⑦寿星（功労の星　神がつくのはこの星だけ）　'
          '⑧衣食に恵まれる星（食べること着ることが大好き）　⑨明るく聡明な星'
          '⑩恥ずかしがりやな星　⑪健康的な色星　⑫財星を生じ財星を助ける星'
          '⑬吉星なのでポロッと白状してしまう星　⑭笑顔とユーモアで口で人を傷つけない吉星'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '傷官') {
      tuuhenbosiNowKaisetu = '傷官　の持つ意味は,'
          '①感のよい星　'
          '②機転が効き、頭の良い星（手抜きをした割にには勉強ができる　遊んでから勉強する　直前に徹夜で勉強する）　'
          '③一言多い口の星（実際は二言三言多い）　'
          '④正義感が強い星　'
          '⑤せっかちで慌て者の星　⑥特にプライドの高い星　'
          '⑦個性の強い星　⑧譲らない信念の星　⑨こだわって生きている星　⑩約束の変更を嫌がる星　'
          '⑪相手に対して要求が強い星　⑫体を張って生命をかける星　'
          '⑬失敗を素直に認めず、すみませんと言えない星　'
          '⑭人から命令されたり頭を抑えつけられたりするのが大嫌いな星　'
          '⑮やるなと言われればやりたくなる星　'
          '⑯夫が悪いことをしていないかチェックする星　'
          '⑰凶星なのでアリバイ作りがうまく、悪知恵も働きボロを出さず白状しない星　'
          '⑱逃げ場が無いほど口で人を傷つける凶星　'
          '　　■吉ポイントは、マイナス10です。';
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '偏財') {
      tuuhenbosiNowKaisetu = '偏財　の持つ意味は、'
          '①商売・営業の星　'
          '②人に好かれる星　'
          '③交際上手な星　'
          '④話上手な星（「奥さん、奥さん」と言ってさっと懐に入る、アメ横でバナナの叩き売りをするイメージ）　'
          '⑤Noと言えない星　'
          '⑥駆け引き上手な星　'
          '⑦金に縁のある星　'
          '⑧口先だけでボロ儲けする星　'
          '⑨流通に関する商売　'
          '⑩ボーナスのように金が大きく入るが大きく出ていく星　'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '正財') {
      tuuhenbosiNowKaisetu = '正財　の持つ意味は、'
          '①商売・営業の星　'
          '②人に好かれる星　'
          '③交際上手な星（「奥様、奥様」と言って松坂屋で高級服や貴金属を売る上品なイメージ）　'
          '④話上手な星　'
          '⑤Noと言えない星　'
          '⑥駆け引き上手な星　'
          '⑦金に縁のある星　'
          '⑧コツコツ汗水流して得る確実な収入　'
          '⑨給料のように決められた金が確実に入り無茶な金遣いを好まない星'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '偏官') {
      tuuhenbosiNowKaisetu = '偏官　の持つ意味は、'
          '①人間にとって最も重要な日干（自分の肉体）を激しく刻する星'
          '（偏官は殺と言われる、健康に注意すること）　'
          '②女性にとっては官星は男性・異性運を表す（遊び、恋愛、若いツバメ、再婚）　'
          '③活発で行動力があり、動き回る星　'
          '④笑顔もなく、ひきつった顔で動き回る　'
          '⑤星気も短く、落ち着きにかける星（仕事や付き合いで動き回り帰りが遅い）　'
          '　　■吉ポイントは、マイナス10です。';
      kitiPointNikann = -10;
    } else if (tuuhenbosiNow == '正官') {
      tuuhenbosiNowKaisetu = '正官　の持つ意味は、'
          '①誠実、真面目、品格、正直、温厚、品行方正な星　'
          '②上流社会に住む人のイメージで、良いとこのお坊ちゃんお嬢ちゃん　'
          '③一つの与えられた仕事をきちんとする四角四面の人　'
          '④面白みのない要領の悪い人　'
          '⑤地位、名誉、肩書きの星（地位を得やすい）'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '倒食') {
      tuuhenbosiNowKaisetu = '倒食　の持つ意味は、'
          '①人気運の星　（人当たりがよく、ユーモアのある楽しい星）'
          '②明るく融通性があり調子の良い星　'
          '③バタバタと忙しい星（サザエさんのような星、返事はよいがわかっていない、'
          '気ばかり先にいって肝心な所を見落とす）　'
          '④飽きっぽく忘れやすい星（あれもこれもそれもする人、奥がなく一つを極めること）　'
          '⑤趣味、副業の星　'
          '⑥福分の星、衣食に困らない星　'
          '⑦人の世話や厄介事を引き受ける星　'
          '⑧名誉の星　'
          '⑨文化、芸術、学術、宗教の星（日干を強め栄養を送る星）　'
          '（印星からの栄養は親の愛であり、目に見えない精神的な栄養をあらわす。'
          'この印星によって人は救われるので、困ったときの助けの神となる。'
          '困った時に立ち直れる人とは、ⅰ）良きアドバイザーを持つこと・・親、先生、師匠、、コーチ、学術'
          'ⅱ）良き趣味を持つこと・・・文化、芸術、ⅲ）神に助けてもらうこと・・宗教'
          '⑩人助けの星、ボランティアの星　'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    } else if (tuuhenbosiNow == '印綬') {
      tuuhenbosiNowKaisetu = '印綬　の持つ意味は、'
          '①名誉の星　'
          '②文化、芸術、学術、宗教の星（日干を強め栄養を送る星）　'
          '（印星からの栄養は親の愛であり、目に見えない精神的な栄養をあらわす。'
          'この印星によって人は救われるので、困ったときの助けの神となる。'
          '困った時に立ち直れる人とは、ⅰ）良きアドバイザーを持つこと・・親、先生、師匠、、コーチ、学術'
          'ⅱ）良き趣味を持つこと・・・文化、芸術、ⅲ）神に助けてもらうこと・・宗教'
          '③人助けの星、ボランティアの星　'
          '　　■吉ポイントは、プラス10です。';
      kitiPointNikann = 10;
    }

    //　干合を算出する
    var kangouNow = kangou.substring(
        nikkan * 10 + nikkanNow * 1, nikkan * 10 + nikkanNow * 1 + 1);
    if (kangouNow == '合') {
      kangouMoji = '干合(かんごう）があります。干合は、男（＋）と女（ー）の発想の違うカップルが'
          '一緒になると新しいエネルギーが生じ、さらに変化したエネルギーも生じるという意味があります。'
          '吉ポイントは、プラス20です。';
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

    //　支合を算出する
    var sigouNow = sigouKei.substring(
        nissi * 12 + nissiNow * 1, nissi * 12 + nissiNow * 1 + 1);
    if (sigouNow == '合') {
      sigouMoji = '支合（しごう）があります';
      sigouKaisetu = '支合の意味は、仲のいい恋人夫婦の大きな気が発生します。'
          '大吉です。■吉ポイントは、プラス20です。';
      kitiPointNissi = 20;
    } else if (sigouNow == '三') {
      sigouMoji = '三合（さんごう）があります';
      sigouKaisetu = '三合の意味は、女子学生三人組のような関係で、'
          '一人一人は弱くても三人そろうと大きな気を発生します。二人そろった半会（はんかい）でもそれなりの気を発生します。'
          '吉です。■吉ポイントは、プラス10です。';
      kitiPointNissi = 10;
    } else if (sigouNow == '冲') {
      sigouMoji = '冲（ちゅう）があります';
      sigouKaisetu = '冲は、同性同士の殴り合いを意味します。'
          '同性同士なので、激しく殴り合ったり、ひっかきあったり、気をうばわれます。'
          '大凶です。■吉ポイントは、マイナス20です。';
      kitiPointNissi = -20;
    } else if (sigouNow == '害') {
      sigouMoji = '害（がい）があります';
      sigouKaisetu =
          '害は、トラブルを意味します。冲（ちゅう）に比べれば軽く、激しい喧嘩しませんが、トラブルなので気はやはりうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。';
      kitiPointNissi = -10;
    } else if (sigouNow == '刑') {
      sigouMoji = '刑（けい）があります';
      sigouKaisetu =
          '刑は、トラブルを意味します。冲（ちゅう）に比べれば軽く、激しい喧嘩しませんが、トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。';
      kitiPointNissi = -10;
    } else if (sigouNow == '一') {
      sigouMoji = '冲（ちゅう）と刑（けい）があります';
      sigouKaisetu = '悪い作用が重なるのではなく、あるときは冲になり、あるときは刑になります。冲は、同性同士の殴り合いを意味します。'
          '刑は冲に比べれば軽く、激しい喧嘩しませんが、トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス15です。　';
      kitiPointNissi = -15;
    } else if (sigouNow == '二') {
      sigouMoji = '害（がい）と刑（けい）があります';
      sigouKaisetu = '悪い作用が重なるのではなく、あるときは害になり、あるときは刑になります。'
          '刑は重いトラブル、害は軽いトラブルを意味します。トラブルなのでやはり気はうばわれます。'
          '凶です。■吉ポイントは、マイナス10です。　';
      kitiPointNissi = -10;
    } else if (sigouNow == '四') {
      sigouMoji = '支合（しごう）と刑（けい）があります';
      sigouKaisetu = '良い作用の支合と悪い作用の刑が重なります。普段は仲のいい夫婦が急に大げんかするようなような意味です。'
          '仲がいいときは気を発生しますが、喧嘩して気がうばわれます。'
          '吉です。■吉ポイントは、プラス10です。　';
      kitiPointNissi = 10;
    } else if (sigouNow == '五') {
      sigouMoji = '卯辰の害があります';
      sigouKaisetu = '害（がい）は、トラブルを意味しますが、卯辰の害は、冲（ちゅう）のなぐりあいに匹敵する喧嘩を意味します。'
          '夫婦の激しい喧嘩の意味です。気は激しくうばわれます。'
          '中凶です。■吉ポイントは、マイナス15です。';
      kitiPointNissi = -15;
    } else {
      sigouMoji = '支合・三合・冲・害・刑はありません';
      sigouKaisetu = '■吉ポイントは、プラスマイナス０です。';
      kitiPointNissi = 0;
    }

    //　支刑を算出する
    //var sikeiNow = sikei.substring(
    //    nissi * 12 + nissiNow * 1, nissi * 12 + nissiNow * 1 + 1);
    //if (sikeiNow == '刑') {
    //  sigouMoji2 = '・刑';
    //} else {}

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
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('　今日（$dateNow）の運勢は・・・'),
                ),
                ListTile(
                  title: Text('１．「日干」からみた今日の運勢'),
                ),
                ListTile(
                  title: Text('　生年月日の日干が、「$jukkanMoji（$gogyouMoji）」、'
                      '今日の日干が、「$jukkanNow（$gogyouNow）」なので、'
                      '今日の通変星は、'
                      '$tuuhenbosiNow（$tuuhenbosiYomiNow）になります。　図で表すと'
                      '下図のようになります。薄い灰色の円のすぐ内側が（$nikkanYouIn）、'
                      'さらに内側が（$nikkanInYou）を表しています。'),
                ),
                ListTile(
                  title: Image.asset('images/tuuhenbosi/$tuuhendosizuNow.jpg'),
                ),
                ListTile(
                  title: Text('　$tuuhenbosiNowKaisetu'),
                ),
                ListTile(
                  title: Text('　$kangouMoji'),
                ),
                ListTile(
                  title: Text('２．「日支」からみた今日の運勢'),
                ),
                ListTile(
                  title: Text('　生年月日の日支が、「$nissiMoji」、'
                      '今日の日支が、「$nissiNowMoji」で、その関係性を表したのが、下図になります。'
                      'ピンクの矢印がさす部分が今日の運勢です。'),
                ),
                ListTile(
                  title: Image.asset('images/sigou/s$juunisia$juunisiaNow.jpg'),
                ),
                ListTile(
                  title: Text('　$sigouMoji。$sigouKaisetu　'),
                ),
                ListTile(
                  title: Text('　'),
                ),
                ListTile(
                  title: Text('３．総合ポイント'),
                ),
                ListTile(
                  title: Text('　吉凶ポイント：　$kitiPlus$kitiP'),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      '$kitiKyou',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('　'),
                ),
                /*AdmobBanner(
                    adUnitId: AdMobService().getBannerAdUnitId(),
                    adSize: AdmobBannerSize(
                      width: MediaQuery.of(context).size.width.toInt(),
                      height: AdMobService().getHeight(context).toInt(),
                      name: 'SMART_BANNER',
                    )),*/
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
          ),
          Container(
            height: 8,
          ),

          //バナー広告追加
          //if (banner == null)
          SizedBox(
            height: 50,
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
            height: 30,
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
