import 'dart:developer';
import 'dart:ui';
//import 'dart:io';
import 'package:chan_no_sanchusuimei_v3/kyou_unsei.dart';
import 'package:chan_no_sanchusuimei_v3/output.dart';
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
import 'kyou_unsei.dart';
import 'output.dart';
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

  //int _counter = 0;
  String _birthday0 = '';//_***:この中で使う変数　　***:端末に記憶している変数
  String _birthdaya0 = '2000-01-01';
  String birthdayOld0 = '';
  String birthdayHyouji0 = '';
  String _memo0 = 'メモ';
  String seinengappiMojia = '';
  BannerAd banner ;
  DateTime newDate = DateTime.now();//DateTime(1957,3,31);//
  DateTime date9 = DateTime.now();
  //DateTime newDate = DateTime.now();

  /*void _incrementCounter() async {
    setState(() {
      _counter++;
      _birthday0 = _birthday0 + 'a';
      _setPrefItems(); //Shared Preference に値を保存する
    });
  }*/

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
      //_counter = prefs.getInt('counter') ?? 0;
      _birthday0 = prefs.getString('birthday0') ?? '';
      _memo0 = prefs.getString('memo0') ?? '';
    });
    birthdayOld0 = _birthday0;
    seinengappiMojia = _birthday0;
    if (_birthday0 == ''){
      birthdayHyouji0 = '1 : yyyy/mm/dd ?';
    } else{
      birthdayHyouji0 = '1 : $_birthday0 生';
    };
    if (_memo0 == '') { _memo0 = 'メモ'; } else {};
  }

  //データを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    //prefs.setInt('counter', _counter);
    prefs.setString('birthday0', _birthday0);
    prefs.setString('memo0', _memo0);
  }

  //データを削除する
  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //_counter = 0;
      _birthday0 = '';
      birthdayOld0 = '';
      _memo0 = 'メモ';
      //
      //prefs.remove('counter');
      prefs.remove('birthday0');
      prefs.remove('memo0');
    });
  }

  @override
  void initState() {
    super.initState();
    //
    _getPrefItems();
    /*birthdayOld0 = _birthday0;
    seinengappiMojia = _birthday0;
    if (_birthday0 == ''){
      birthdayHyouji0 = '1 : yyyy/mm/dd ?';
    } else{
      birthdayHyouji0 = '1 : $_birthday0 生';
    }*/
    //print('_birthday0:$_birthday0');
    //print('bithdayHuouji0:$birthdayHyouji0');
    /*if ( _birthday0 == ''){

    } else {
      DateTime date9 = DateTime(
          int.parse(_birthday0.substring(0, 4)),
          int.parse(_birthday0.substring(5, 7)),
          int.parse(_birthday0.substring(8, 10)));
    }*/
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
            //

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
                              print('a:date9:$date9');
                            } else {
                              _birthdaya0 = _birthday0.substring(0, 4) + '-'
                                  + _birthday0.substring(5, 7) + '-'
                                  + _birthday0.substring(8, 10);
                              date9 = DateTime.parse(_birthdaya0);
                              print('b:date9:$date9');
                            };
                            print('d:_birthday0:$_birthday0');
                            print('d:_birthdaya0:$_birthdaya0');

                            print('c:date9:$date9');

                            _showCupertinoDatePicker(context);
                            //setState(() {});
                          },
                        )
                    ),
                    SizedBox(
                      width: 70,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: _memo0
                        ),
                        onChanged: (text) {
                          print('First text field: $text');
                          _memo0 = text;
                          _setPrefItems();
                          print('_memo0:$_memo0');
                        },

                      ),
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KyouUnsei(
                                titleSeinengappi: seinengappiMojia,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Output(
                                titleSeinengappi: seinengappiMojia,
                              ),
                            ),
                          );
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

            //







            /*Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('$_counter : $_birthday0'),
            ),*/
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('1: $_birthday0 生： $_memo0'),
            ),
            /*IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KyouUnsei(
                      titleSeinengappi: seinengappiMojia,
                    ),
                  ),
                );
              },
            ),*/
            /*SizedBox(
              height: 30,
              width: 40,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  primary: Colors.blue,
                  elevation: 4,
                  shadowColor: Colors.red,
                ),
                child: Icon(Icons.bar_chart,size:20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Touroku(),
                      ));
                },

              ),
            ),*/
            /*SizedBox(
              height: 30,
              width: 40,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 4,
                  shadowColor: Colors.red,
                ),
                onPressed: () => _removePrefItems(),
                child: Icon(Icons.arrow_forward,size: 20,),
              ),
            ),*/
            Container(
              width: double.infinity,
              height: 4,
              color: Colors.white70,
              child: Text(''),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
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
                      initialDateTime: date9 ,
                      onDateTimeChanged: (newDate){
                      print(newDate);
                      _birthday0 = DateFormat('yyyy/MM/dd').format(newDate);
                      birthdayHyouji0 = '1 : $_birthday0 生';
                      print('DP:_birthday0:$_birthday0');
                      setState(() {
                      });
                    },
                    minimumYear: 1900,
                    maximumYear: DateTime.now().year + 10,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(child: Text('キャンセル'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 4,
                          shadowColor: Colors.red,
                        ),

                        onPressed: () {
                          //_getPrefItems();
                          _birthday0 = birthdayOld0;
                          if (_birthday0 == ''){
                            birthdayHyouji0 = '1 : yyyy/mm/dd ?';
                          } else{
                            birthdayHyouji0 = '1 : $_birthday0 生';
                          }
                          print('_birthday0:$_birthday0');
                          print('bithdayHuouji0:$birthdayHyouji0');
                          if ( _birthday0 == ''){
                            DateTime date9 = DateTime.now();
                          } else {
                            DateTime date9 = DateTime(
                                int.parse(_birthday0.substring(0, 4)),
                                int.parse(_birthday0.substring(5, 7)),
                                int.parse(_birthday0.substring(8, 10)));
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                        },

                      ),
                      ElevatedButton(child: Text('削除'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 4,
                          shadowColor: Colors.red,
                        ),

                          onPressed: () async {
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('確認'),
                                  content: Text('$_birthday0 を削除しますか？'),
                                  actions: <Widget>[
                                    ElevatedButton(child: Text('Cancel'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          elevation: 4,
                                          shadowColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }
                                    ),
                                    ElevatedButton(child: Text('OK'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          elevation: 4,
                                          shadowColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          //_birthday0 =  DateFormat('yyyy/MM/dd').format(newDate);
                                          birthdayHyouji0 = '1 : yyyy/mm/dd 生';
                                          DateTime date9 = DateTime.now();
                                          print('OK:_birthday0:$_birthday0');
                                          print(date9);
                                          _removePrefItems();
                                          setState(() {

                                          });
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        }
                                    ),
                                  ],
                                );
                              },
                            );
                            print('dialog result: $result');
                            //Navigator.of(context).pop(); // --

                          }

                      ),
                      ElevatedButton(child: Text('登録'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 4,
                          shadowColor: Colors.red,
                        ),
                          onPressed: () async {
                        //TODO;
                            if (_birthday0 == ''){
                              _birthday0 = DateFormat('yyyy/MM/dd').format(DateTime.now());
                            }else{

                            };
                            var result = await showDialog<int>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('確認'),
                                content: Text('$_birthday0 で登録しますか？'),
                                actions: <Widget>[
                                  ElevatedButton(child: Text('Cancel'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        elevation: 4,
                                        shadowColor: Colors.red,
                                      ),
                                    onPressed: () {

                                      _birthday0 = birthdayOld0;
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    }
                                  ),
                                  ElevatedButton(child: Text('OK'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        elevation: 4,
                                        shadowColor: Colors.red,
                                      ),
                                    onPressed: () {
                                      //_birthday0 =  DateFormat('yyyy/MM/dd').format(newDate);
                                      birthdayHyouji0 = '1 : $_birthday0 生';
                                      birthdayOld0 = _birthday0;
                                      seinengappiMojia = _birthday0;
                                      DateTime date9 = DateTime(
                                          int.parse(_birthday0.substring(0, 4)),
                                          int.parse(_birthday0.substring(5, 7)),
                                          int.parse(_birthday0.substring(8, 10)));
                                      print('OK:_birthday0:$_birthday0');
                                      print(date9);
                                      _setPrefItems();
                                      setState(() {

                                      });
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    }
                                  ),
                                ],
                              );
                            },
                          );
                          print('dialog result: $result');
                          //Navigator.of(context).pop(); // --

                          }
    // ダイアログを表示------------------------------------


                          /*onPressed: () {
                          //birthdayHouji = DateFormat('yyyy/MM/dd').format(newDate);
                          //print('$birthdayHouji');
                          //setState(() {

                          //});
                          Navigator.of(context).pop();
                        },*/

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


//okTODO: DatePickerダイアログ　を表示する
//okTODO: DatePicker を　登録ボタンをおしたあと消すには
//okTODO:   〃　　　　　　　キャンセルをおしたあと消すには
//okTODO: _birthday0　が　null のとき　登録画面
//okODO: DatePicke の最小・最大年月日の決定
//okTODO: DatePicker の初期年月日　null なら今日、そうでないならOld誕生日
//TODO: 生年月日削除したのにメモが消えない
