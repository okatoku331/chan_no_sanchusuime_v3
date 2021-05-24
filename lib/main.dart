import 'dart:ui';
//import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:chan_no_sanchusuimei_v3/osirase/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  String _birthday0 = '';
  String _birthday1 = '';
  String _birthday2 = '';
  String _birthday3 = '';
  String _birthday4 = '';
  String _memo0 = '';
  String _memo1 = '';
  String _memo2 = '';
  String _memo3 = '';
  String _memo4 = '';
  BannerAd banner ;

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
      _birthday1 = prefs.getString('birthday1') ?? '';
      _birthday2 = prefs.getString('birthday2') ?? '';
      _birthday3 = prefs.getString('birthday3') ?? '';
      _birthday4 = prefs.getString('birthday4') ?? '';
      _memo0 = prefs.getString('memo0') ?? '';
      _memo1 = prefs.getString('memo1') ?? '';
      _memo2 = prefs.getString('memo2') ?? '';
      _memo3 = prefs.getString('memo3') ?? '';
      _memo4 = prefs.getString('memo4') ?? '';
    });
  }

  //データを書き込む
  _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    prefs.setInt('counter', _counter);
    prefs.setString('birthday0', _birthday0);
    prefs.setString('birthday1', _birthday1);
    prefs.setString('birthday2', _birthday2);
    prefs.setString('birthday3', _birthday3);
    prefs.setString('birthday4', _birthday4);
    prefs.setString('memo0', _memo0);
    prefs.setString('memo1', _memo1);
    prefs.setString('memo2', _memo2);
    prefs.setString('memo3', _memo3);
    prefs.setString('memo4', _memo4);
  }

  //データを削除する
  _removePrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = 0;
      _birthday0 = '';
      _birthday1 = '';
      _birthday2 = '';
      _birthday3 = '';
      _birthday4 = '';
      _memo0 = '';
      _memo1 = '';
      _memo2 = '';
      _memo3 = '';
      _memo4 = '';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('三柱推命(生年月日占い/今日の運勢)'),
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
            //バナー広告追加
            if (banner == null)
              SizedBox(height: 50) // Ads
            else
              Container(
                height: 50,
                child: AdWidget(ad: banner),
              ),
            //バナー広告ここまで*/
            Image.asset('$aaa'),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('あなたの日干はなんですか？'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('$_counter : $_birthday0'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('1: $_birthday0 生： $_memo0'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('2: $_birthday1 生： $_memo1'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('3: $_birthday2 生： $_memo2'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('4: $_birthday3 生： $_memo3'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('5: $_birthday4 生： $_memo4'),
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
                      builder: (context) => SeinengappiInput(),
                    ));
              },
              child: Text('生年月日を入力して日干を求める'),
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
}
