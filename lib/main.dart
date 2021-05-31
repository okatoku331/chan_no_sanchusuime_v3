import 'dart:developer';
import 'dart:ui';
//import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:chan_no_sanchusuimei_v3/osirase/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:intl/date_symbol_data_local.dart';
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
import 'touroku.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ja'),
      ],
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

  int _counter = 0;
  String _birthday0 = '';//_***:この中で使う変数　　***:端末に記憶している変数
  String birthdayHouji ;
  String _memo0 = '';
  BannerAd banner ;
  DateTime newDate = DateTime.now();//DateTime(1957,3,31);//

  void _incrementCounter() async {
    setState(() {
      _counter++;
      _birthday0 = _birthday0 + 'a';
      _setPrefItems(); //Shared Preference に値を保存する
    });
  }

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
      _counter = prefs.getInt('counter') ?? 0;
      _birthday0 = prefs.getString('birthday0') ?? '';
      _memo0 = prefs.getString('memo0') ?? '';
    });
  }

  //データを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    prefs.setInt('counter', _counter);
    prefs.setString('birthday0', _birthday0);
    prefs.setString('memo0', _memo0);
  }

  //データを削除する
  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = 0;
      _birthday0 = '';
      _memo0 = '';
      //
      prefs.remove('counter');
      prefs.remove('birthday0');
    });
  }

  @override
  void initState() {
    super.initState();
    //
    _getPrefItems();
  }

    var aaa = 'images/main/hana1.jpg';
  //String birthdayHyouji = _birthday0;


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
            //

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 180,
                            child: TextButton(
                              child: Text(
                              '1 : $birthdayHouji 生',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                              ),
                              ),
                              onPressed: () {
                                _showCupertinoDatePicker(context);
                                setState(() {

                                });
                              },
                            )
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'メモ'
                              ),
                              onChanged: (text) {
                                print('First text field: $text');
                                _memo0 = text;
                                print('_memo0:$_memo0');
                              },

                            ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.bar_chart),
                        Container(
                          width: 8,
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            //







            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('$_counter : $_birthday0'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('1: $_birthday0 生： $_memo0'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                elevation: 4,
                shadowColor: Colors.red,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Touroku(),
                    ));
              },
              child: Text('占う'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                elevation: 4,
                shadowColor: Colors.red,
              ),
              onPressed: () => _removePrefItems(),
              child: Text('削除する'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 260,
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime(
                        int.parse(birthdayHouji.substring(0, 4)),
                        int.parse(birthdayHouji.substring(5, 7)),
                        int.parse(birthdayHouji.substring(8, 10))
                    ),
                    onDateTimeChanged: (DateTime newDate){
                      print(newDate);
                      birthdayHouji = DateFormat('yyyy/MM/dd').format(newDate);
                      setState(() {

                      });
                    },
                    minimumYear: 2015,
                    maximumYear: 2025,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 4,
                          shadowColor: Colors.red,
                        ),
                        onPressed: () {},
                        child: Text('キャンセル'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 4,
                          shadowColor: Colors.red,
                        ),
                        onPressed: () {
                          //birthdayHouji = DateFormat('yyyy/MM/dd').format(newDate);
                          //print('$birthdayHouji');
                          //setState(() {

                          //});
                          Navigator.of(context).pop();
                        },
                        child: Text('登録'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}


//TODO: DatePicker を　登録ボタンをおしたあと消すには
//TODO:   〃　　　　　　　キャンセルをおしたあと消すには

