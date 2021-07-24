import 'dart:ui';
import 'package:chan_no_sanchusuimei_v3/book_list/book_list_page0.dart';
import 'package:chan_no_sanchusuimei_v3/quiz/Quiz001.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:chan_no_sanchusuimei_v3/quiz/quiz001b.dart';
//import 'package:chan_no_sanchusuimei_v3/quiz/quiz001a.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../osirase/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../services/ad_state.dart';
import '../input/seinengappi_input.dart';
import '../nikkan/nikkan_hinoe.dart';
import '../nikkan/nikkan_hinoto.dart';
import '../nikkan/nikkan_kanoe.dart';
import '../nikkan/nikkan_kanoto.dart';
import '../nikkan/nikkan_kinoe.dart';
import '../nikkan/nikkan_kinoto.dart';
import '../nikkan/nikkan_mizunoe.dart';
import '../nikkan/nikkan_mizunoto.dart';
import '../nikkan/nikkan_tsutinoe.dart';
import '../nikkan/nikkan_tsutinoto.dart';

//import 'quiz/quiz001a.dart';
import '../output/kyou_unsei.dart';
import '../output/output.dart';

void main() async {
  //google_mobile_adsを配置するため追加 2021.5.24
  WidgetsFlutterBinding.ensureInitialized();
  // FireBase core 0.5.0 以降ここで初期化することが必要
  await Firebase.initializeApp();
  // 追加以上
  final initFuture = MobileAds.instance.initialize();
  final adSate = AdState(initFuture);
  runApp(Provider.value(
    value: adSate,
    builder: (context, child) => MyApp(),
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
      locale: Locale('ja', 'JP'),
      //　日本語化ここまで
      title: '三柱推命【生年月日占い】',
      //Flutter Demo', //三柱推命【生年月日占い】',
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
  String _birthday = '';
  String _birthdaya = '2000-01-01';
  String birthdayHyouji = '';
  String birthdayOld = '';
  List<String> _birthD = [
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd'
  ];
  List<String> _birthH = [
    '1 : yyyy/mm/dd ?',
    '2 : yyyy/mm/dd ?',
    '3 : yyyy/mm/dd ?',
    '4 : yyyy/mm/dd ?',
    '5 : yyyy/mm/dd ?'
  ];
  List<String> _birthO = [
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd',
    'yyyy/mm/dd'
  ];
  List<String> _memoH = ['メモ', 'メモ', 'メモ', 'メモ', 'メモ'];

  String _birthday0 = '';
  String _birthday1 = '';
  String _birthday2 = '';
  String _birthday3 = '';
  String _birthday4 = '';

  String _memo0 = 'メモ';
  String _memo1 = 'メモ';
  String _memo2 = 'メモ';
  String _memo3 = 'メモ';
  String _memo4 = 'メモ';
  String _memo = 'メモ';
  String seinengappiMojia = '';

  BannerAd banner;

  DateTime newDate = DateTime.now();
  DateTime date9 = DateTime.now();
  int item = 0;

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
    setState(() {
      _birthday0 = prefs.getString('birthday0') ?? 'yyyy/mm/dd';
      _birthday1 = prefs.getString('birthday1') ?? 'yyyy/mm/dd';
      _birthday2 = prefs.getString('birthday2') ?? 'yyyy/mm/dd';
      _birthday3 = prefs.getString('birthday3') ?? 'yyyy/mm/dd';
      _birthday4 = prefs.getString('birthday4') ?? 'yyyy/mm/dd';
      _memo0 = prefs.getString('memo0') ?? 'メモ';
      _memo1 = prefs.getString('memo1') ?? 'メモ';
      _memo2 = prefs.getString('memo2') ?? 'メモ';
      _memo3 = prefs.getString('memo3') ?? 'メモ';
      _memo4 = prefs.getString('memo4') ?? 'メモ';
    });
    _birthD.removeAt(0);
    _birthD.insert(0, _birthday0);
    _birthD.removeAt(1);
    _birthD.insert(1, _birthday1);
    _birthD.removeAt(2);
    _birthD.insert(2, _birthday2);
    _birthD.removeAt(3);
    _birthD.insert(3, _birthday3);
    _birthD.removeAt(4);
    _birthD.insert(4, _birthday4);

    _memoH.removeAt(0);
    _memoH.insert(0, _memo0);
    _memoH.removeAt(1);
    _memoH.insert(1, _memo1);
    _memoH.removeAt(2);
    _memoH.insert(2, _memo2);
    _memoH.removeAt(3);
    _memoH.insert(3, _memo3);
    _memoH.removeAt(4);
    _memoH.insert(4, _memo4);

    for (int i = 0; i < 5; i++) {
      int j = i + 1;
      _birthday = _birthD[i];
      if (_birthday == 'yyyy/mm/dd') {
        birthdayHyouji = '$j : yyyy/mm/dd ?';
      } else {
        birthdayHyouji = '$j : $_birthday 生';
      }
      _birthH.removeAt(i);
      _birthH.insert(i, birthdayHyouji);
      _birthO.removeAt(i);
      _birthO.insert(i, _birthday);
    }
    setState(() {});
  }

  //データを書き込む
  _setPrefMemo(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (item == 0) {
        prefs.setString('memo0', _memoH[item]);
      } else if (item == 1) {
        prefs.setString('memo1', _memoH[item]);
      } else if (item == 2) {
        prefs.setString('memo2', _memoH[item]);
      } else if (item == 3) {
        prefs.setString('memo3', _memoH[item]);
      } else if (item == 4) {
        prefs.setString('memo4', _memoH[item]);
      } else {}
    });
  }

  //データを書き込む
  _setPrefItems(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int j = item + 1;
    //
    //item = i;
    _birthD.removeAt(item);
    _birthD.insert(item, _birthday);
    _birthO.removeAt(item);
    _birthO.insert(item, _birthday);
    _birthH.removeAt(item);
    _birthH.insert(item, '$j : $_birthday 生');
    if (item == 0) {
      _birthday0 = _birthday;
      prefs.setString('birthday0', _birthD[item]);
    } else if (item == 1) {
      prefs.setString('birthday1', _birthD[item]);
    } else if (item == 2) {
      prefs.setString('birthday2', _birthD[item]);
    } else if (item == 3) {
      prefs.setString('birthday3', _birthD[item]);
    } else if (item == 4) {
      prefs.setString('birthday4', _birthD[item]);
    } else {}

    setState(() {});
  }

  //データを削除する
  _removePrefItems(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    seinengappiMojia = ''; //TODO: このコード気になる
    int j = item + 1;
    _birthD.removeAt(item);
    _birthD.insert(item, 'yyyy/mm/dd');
    _birthO.removeAt(item);
    _birthO.insert(item, 'yyyy/mm/dd');
    _birthH.removeAt(item);
    _birthH.insert(item, '$j : yyyy/mm/dd 生');
    _memoH.removeAt(item);
    _memoH.insert(item, 'メモ');
    if (item == 0) {
      setState(() {
        prefs.remove('birthday0');
        prefs.remove('memo0');
      });
    } else if (item == 1) {
      setState(() {
        prefs.remove('birthday1');
        prefs.remove('memo1');
      });
    } else if (item == 2) {
      setState(() {
        prefs.remove('birthday2');
        prefs.remove('memo2');
      });
    } else if (item == 3) {
      setState(() {
        prefs.remove('birthday3');
        prefs.remove('memo3');
      });
    } else if (item == 4) {
      setState(() {
        prefs.remove('birthday4');
        prefs.remove('memo4');
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    //
    Firebase.initializeApp().whenComplete(() {
      setState(() {
        print('■■■■■■■■イニシャライズ完了■■■■■■■■');
      });
    });
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
      body: Container(
        //color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 4,
              ),
              // 一行目の表示
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 生年月日表示欄
                            SizedBox(
                                height: 44,
                                width: 174,
                                child: TextButton(
                                  child: Text(
                                    _birthH[index],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () {
                                    _birthday = _birthD[index];
                                    if (_birthday == 'yyyy/mm/dd') {
                                      date9 = DateTime.now();
                                      //print('a:date9:$date9');
                                    } else if (_birthday == '') {
                                      date9 = DateTime.now();
                                      //print('b:date9:$date9');
                                    } else {
                                      _birthdaya = _birthday.substring(0, 4) +
                                          '-' +
                                          _birthday.substring(5, 7) +
                                          '-' +
                                          _birthday.substring(8, 10);
                                      date9 = DateTime.parse(_birthdaya);
                                      //print('c:date9:$date9');
                                    }
                                    _showCupertinoDatePicker(context, index);
                                    setState(() {});
                                  },
                                )),

                            // メモ　欄　の表示
                            SizedBox(
                              //height: 24,
                              width: 70,
                              child: TextButton(
                                child: Text(
                                  _memoH[index],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {
                                  _showInputDialog(context, index);
                                },
                              ),
                            ),

                            // 今日の運勢　ボタン
                            SizedBox(
                              height: 24,
                              width: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  elevation: 0,
                                  shadowColor: Colors.red,
                                ),
                                child: Icon(Icons.bar_chart, size: 16),
                                onPressed: () {
                                  seinengappiMojia = _birthD[index];
                                  if (seinengappiMojia == 'yyyy/mm/dd') {
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
                              height: 24,
                              width: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  elevation: 0,
                                  shadowColor: Colors.red,
                                ),
                                child: Icon(Icons.arrow_forward_ios, size: 16),
                                onPressed: () {
                                  seinengappiMojia = _birthD[index];
                                  if (seinengappiMojia == 'yyyy/mm/dd') {
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
                    );
                  },
                ),
              ),
              // 1行目の表示　ここまで

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text('易占クイズ'),
                        onPressed: () {
                          //TODO: 易占クイズ画面へ飛ぶ
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quiz001(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 8,
              ),
              Container(
                child: Image.asset('images/main/wagou.jpeg'),
                height: 216,
              ),
              Container(
                height: 8,
              ),

              //バナー広告追加
              if (banner == null)
                SizedBox(height: 50) // Ads
              else
                Container(
                  height: 50,
                  child: AdWidget(ad: banner),
                ),
              //バナー広告ここまで*/

              Container(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 画面下からDatePickerを表示する
  void _showCupertinoDatePicker(BuildContext context, int i) {
    int j = i + 1;
    _birthday = _birthD[i];
    birthdayOld = _birthD[i];
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 260,
            child: Column(
              children: [
                // iOS タイプのDatePickerを表示
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    //backgroundColor: Colors.blue,
                    initialDateTime: date9,
                    minimumYear: 1900,
                    maximumYear: DateTime.now().year + 10,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (newDate) {
                      _birthday = DateFormat('yyyy/MM/dd').format(newDate);
                      birthdayHyouji = '($j : $_birthday 生';
                      //print('newDate:$newDate');
                      setState(() {});
                    },
                  ),
                ),

                // 「キャンセル」「削除」「登録」ボタン
                Container(
                  //color: Colors.blue,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // キャンセル　ボタン
                      TextButton(
                        child: Text('キャンセル'),
                        onPressed: () {
                          _birthday = birthdayOld;
                          if (_birthday == 'yyyy/mm/dd') {
                            birthdayHyouji = '$j : yyyy/mm/dd ?';
                          } else {
                            birthdayHyouji = '$j : $_birthday 生';
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),

                      // 「削除」ボタン
                      TextButton(
                          child: Text('削除'),
                          onPressed: () async {
                            _birthday = _birthO[i];
                            if (_birthday == 'yyyy/mm/dd') {
                            } else {
                              var result = await showDialog<int>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  // 削除のダイアログを表示
                                  return AlertDialog(
                                    content: Text('$_birthday を削除しますか？'),
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
                                            //birthdayHyouji =
                                            //   '$j : yyyy/mm/dd 生';
                                            //TODO: 削除処理検討する必要あり
                                            _removePrefItems(i);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          }),
                                    ],
                                  );
                                },
                              );
                              //print('dialog result: $result');
                            }
                          }),

                      // 「登録」　ボタン
                      TextButton(
                          child: Text('登録'),
                          onPressed: () async {
                            //TODO;
                            if (_birthday == 'yyyy/mm/dd') {
                              _birthday = DateFormat('yyyy/MM/dd')
                                  .format(DateTime.now());
                            } else {}
                            var result = await showDialog<int>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                // 登録　ダイアログを表示する
                                return AlertDialog(
                                  content: Text('$_birthday で登録しますか？'),
                                  actions: <Widget>[
                                    //「Cancel」ボタン
                                    TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        }),

                                    // 「OK」ボタン
                                    TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          //TODO: sakujo?
                                          birthdayHyouji = ' : $_birthday 生';
                                          birthdayOld = _birthday;
                                          seinengappiMojia = _birthday;
                                          //TODO:セットを検討する必要あり
                                          _setPrefItems(i);
                                          setState(() {});
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          setState(() {});
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

  // 画面下からDatePickerを表示する
  void _showInputDialog(BuildContext context, int i) {
    String _memo = _memoH[i];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('タイトル'),
          content: TextField(
            decoration: InputDecoration(
              hintText: _memo,
            ),
            onChanged: (text) {
              _memo = text;
            },
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('削除'),
                onPressed: () {
                  _memo = 'メモ';
                  _memoH.removeAt(i);
                  _memoH.insert(i, _memo);
                  _setPrefMemo(i);
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('登録'),
                onPressed: () {
                  _memoH.removeAt(i);
                  _memoH.insert(i, _memo);
                  _setPrefMemo(i);
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
