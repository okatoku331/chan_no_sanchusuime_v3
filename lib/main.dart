import 'dart:ui';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'seinengappi_input.dart';
import 'jiko_syoukai.dart';
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
import 'services/admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //AdMob初期化の前に必要
  Admob.initialize(); //AdMob初期化
  runApp(MyApp());
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // デフォルトのルーティング
      initialRoute: '/',
      // ルーティングの一覧を設定
      routes: {
        //'/': (context) => MyHomePage(),
        '/seinengappiInput': (context) => SeinengappiInput(), //生年月日入力
        //'/seinengappiOutput': (context) => SeinengappiOutput(titleSeinengappi: ''), //生年月日結果
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャンの三柱推命v3'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JikoSyoukai(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/チャン_1.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('あなたの日干はなんですか？'),
            ),
            Container(
              width: double.infinity,
              height: 280,
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 300,
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('甲'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan0');
                          },
                        ),
                        ElevatedButton(
                          child: Text('丙'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan2');
                          },
                        ),
                        ElevatedButton(
                          child: Text('戊'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan4');
                          },
                        ),
                        ElevatedButton(
                          child: Text('庚'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan6');
                          },
                        ),
                        ElevatedButton(
                          child: Text('壬'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan8');
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 300,
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('乙'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan1');
                          },
                        ),
                        ElevatedButton(
                          child: Text('丁'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan3');
                          },
                        ),
                        ElevatedButton(
                          child: Text('己'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan5');
                          },
                        ),
                        ElevatedButton(
                          child: Text('辛'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan7');
                          },
                        ),
                        ElevatedButton(
                          child: Text('癸'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/nikkan9');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('生年月日を入力して日干を求める'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeinengappiInput(),
                    ));
              },
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.white70,
              child: Text(''),
            ),
            AdmobBanner(
              adUnitId: AdMobService().getBannerAdUnitId(),
              adSize: AdmobBannerSize(
                width: MediaQuery.of(context).size.width.toInt(),
                height: AdMobService().getHeight(context).toInt(),
                name: 'SMART_BANNER',
              ),
            )
          ],
        ),
      ),
    );
  }
}
