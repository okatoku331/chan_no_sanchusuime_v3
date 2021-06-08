import 'dart:ui';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'osirase/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'services/ad_state.dart';
import 'seinengappi_input.dart';
import 'nikkan/nikkan_hinoe.dart';
import 'nikkan/nikkan_hinoto.dart';
import 'nikkan/nikkan_kanoe.dart';
import 'nikkan/nikkan_kanoto.dart';
import 'nikkan/nikkan_kinoe.dart';
import 'nikkan/nikkan_kinoto.dart';
import 'nikkan/nikkan_mizunoe.dart';
import 'nikkan/nikkan_mizunoto.dart';
import 'nikkan/nikkan_tsutinoe.dart';
import 'nikkan/nikkan_tsutinoto.dart';
import 'kyou_unsei.dart';
import 'output.dart';

void main() {
  //google_mobile_adsを配置するため追加 2021.5.24
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adSate =AdState(initFuture);
  runApp(Provider.value(
    value: adSate,
    builder: (context,child) => MyApp(),
  ));
  //追加ここまで
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // DatePickerを日本語化する
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ja'),
      ],
      locale:  Locale('ja', 'JP'),
      //　日本語化ここまで
      title: '三柱推命【生年月日占い】', //Flutter Demo', //三柱推命【生年月日占い】',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // デフォルトのルーティング
      initialRoute: '/',
      // ルーティングの一覧を設定
      routes: {
        '/seinengappiInput': (context) => SeinengappiInput(), //生年月日入力
        '/nikkan0': (context) => NikkanKinoe(), //甲
        '/nikkan1': (context) => NikkanKinoto(), //乙
        '/nikkan2': (context) => NikkanHinoe(), //丙
        '/nikkan3': (context) => NikkanHinoto(), //丁
        '/nikkan4': (context) => NikkanTsutinoe(), //戊
        '/nikkan5': (context) => NikkanTsutinoto(), //己
        '/nikkan6': (context) => NikkanKanoe(), //庚
        '/nikkan7': (context) => NikkanKanoto(), //辛
        '/nikkan8': (context) => NikkanMizunoe(), //壬
        '/nikkan9': (context) => NikkanMizunoto(), //癸
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _birthday0 = '';//_***:この中で使う変数　　***:端末に記憶している変数
  String _birthdaya0 = '2000-01-01';
  String birthdayOld0 = '';
  String birthdayHyouji0 = '';
  String _memo0 = 'メモ';
  String seinengappiMojia = '';
  BannerAd banner ;
  DateTime newDate = DateTime.now();//DateTime(1957,3,31);//
  DateTime date9 = DateTime.now();

   //google_mobile_adsを配置するため追加 2021.5.24
  //BannerAd banner;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }
  //追加ここまで*/

  // shareed Preference に保存されているデータを読み込んで、_counterにセットする
  _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    setState(() {
      _birthday0 = prefs.getString('birthday0') ?? '';
      _memo0 = prefs.getString('memo0') ?? '';
    });
    birthdayOld0 = _birthday0;
    seinengappiMojia = _birthday0;
    if (_birthday0 == ''){
      birthdayHyouji0 = '1 : yyyy/mm/dd ?';
    } else{
      birthdayHyouji0 = '1 : $_birthday0 生';
    }
    if (_memo0 == '') { _memo0 = 'メモ'; } else {}
  }

  //データを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    prefs.setString('birthday0', _birthday0);
    prefs.setString('memo0', _memo0);
  }

  //データを削除する
  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _birthday0 = '';
      birthdayOld0 = '';
      _memo0 = 'メモ';
      seinengappiMojia ='';
      //
      prefs.remove('birthday0');
      prefs.remove('memo0');
    });
  }

  @override
  void initState() {
    super.initState();
    //
    _getPrefItems();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('天運三柱推命'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Update(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 一行目の表示
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white38,

                      borderRadius: BorderRadius.circular(16
                      ),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // 生年月日表示欄
                    SizedBox(
                        width: 170,
                        child: TextButton(
                          child: Text(
                          '$birthdayHyouji0',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                          ),
                          onPressed: () {
                            if (_birthday0 == ''){
                              date9 = DateTime.now();
                            } else {
                              _birthdaya0 = _birthday0.substring(0, 4) + '-'
                                  + _birthday0.substring(5, 7) + '-'
                                  + _birthday0.substring(8, 10);
                              date9 = DateTime.parse(_birthdaya0);
                              print('b:date9:$date9');
                            }
                            _showCupertinoDatePicker(context);
                          },
                        )
                    ),

                    // メモ　欄　の表示
                    SizedBox(
                      width: 70,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: _memo0
                        ),
                        onChanged: (text) {
                          _memo0 = text;
                          _setPrefItems();
                        },
                      ),
                    ),

                    // 今日の運勢　ボタン
                    SizedBox(
                      height: 30,
                      width: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          elevation: 0,
                          shadowColor: Colors.red,
                        ),
                        child: Icon(Icons.bar_chart,size:24),
                        onPressed: () {
                          if (seinengappiMojia == '') {
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KyouUnsei(
                                  titleSeinengappi: seinengappiMojia,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    // スペース
                    SizedBox(
                      width: 8,
                    ),

                    // 性格・天地徳合　ボタン
                    SizedBox(
                      height: 30,
                      width: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          elevation: 0,
                          shadowColor: Colors.red,
                        ),
                        child: Icon(Icons.arrow_forward_ios,size:24),
                        onPressed: () {
                          if (seinengappiMojia == '') {
                          } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Output(
                                titleSeinengappi: seinengappiMojia,
                              ),
                            ),
                          );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('1: $_birthday0 生： $_memo0'),
            ),
            Container(
              width: double.infinity,
              height: 4,
              color: Colors.white70,
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }


  // 画面下からDatePickerを表示する
  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 260,
            child: Column(
              children: [

                // iOS タイプのDatePickerを表示
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                      initialDateTime: date9 ,
                      onDateTimeChanged: (newDate){
                      _birthday0 = DateFormat('yyyy/MM/dd').format(newDate);
                      birthdayHyouji0 = '1 : $_birthday0 生';
                      setState(() {
                      });
                    },
                    minimumYear: 1900,
                    maximumYear: DateTime.now().year + 10,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),

                // 「キャンセル」「削除」「登録」ボタン
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      // キャンセル　ボタン
                      TextButton(child: Text('キャンセル'),
                        onPressed: () {
                          //_getPrefItems();
                          _birthday0 = birthdayOld0;
                          if (_birthday0 == ''){
                            birthdayHyouji0 = '1 : yyyy/mm/dd ?';
                          } else{
                            birthdayHyouji0 = '1 : $_birthday0 生';
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),

                      // 「削除」ボタン
                      TextButton(
                          child: Text('削除'),
                          onPressed: () async {
                            if (_birthday0 == '') {
                            } else {
                              var result = await showDialog<int>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {

                                  // 削除のダイアログを表示
                                  return AlertDialog(
                                    content: Text('$_birthday0 を削除しますか？'),
                                    actions: <Widget>[

                                      // 「Cancel」ボタン
                                      TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),

                                      // 「OK」ボタン
                                      TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            birthdayHyouji0 =
                                                '1 : yyyy/mm/dd 生';
                                            _removePrefItems();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          }),
                                    ],
                                  );
                                },
                              );
                              print('dialog result: $result');
                            }
                          }),

                      // 「登録」　ボタン
                      TextButton(
                          child: Text('登録'),
                          onPressed: () async {
                            //TODO;
                            if (_birthday0 == '') {
                              _birthday0 = DateFormat('yyyy/MM/dd')
                                  .format(DateTime.now());
                            } else {}
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {

                                // 登録　ダイアログを表示する
                                return AlertDialog(
                                  content: Text('$_birthday0 で登録しますか？'),
                                  actions: <Widget>[

                                    //「Cancel」ボタン
                                    TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          _birthday0 = birthdayOld0;
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        }),

                                    // 「OK」ボタン
                                    TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          birthdayHyouji0 = '1 : $_birthday0 生';
                                          birthdayOld0 = _birthday0;
                                          seinengappiMojia = _birthday0;
                                          _setPrefItems();
                                          setState(() {});
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                );
                              },
                            );
                            //print('dialog result: $result');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//okTODO: DatePickerダイアログ　を表示する
//okTODO: DatePicker を　登録ボタンをおしたあと消すには
//okTODO:   〃　　　　　　　キャンセルをおしたあと消すには
//okTODO: _birthday0　が　null のとき　登録画面
//okODO: DatePicke の最小・最大年月日の決定
//okTODO: DatePicker の初期年月日　null なら今日、そうでないならOld誕生日
//TODO: 生年月日削除したのにメモが消えない
//TODO: 生年月日、未入力時に、鑑定ボタンを押すと赤面エラーになる
//TODO: 生年月日、無入力時に、削除ボタンを押すと「生年月日は登録されていません」と表示する
