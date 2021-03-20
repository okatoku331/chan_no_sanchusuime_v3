import 'package:admob_flutter/admob_flutter.dart';
//import 'package:chan_no_sanchusuimei_v3/jiko_syoukai.dart';
import 'package:flutter/material.dart';
import 'services/admob.dart';

class KaisetuTentitokugou extends StatelessWidget {
  final String titleSeinengappi;
  KaisetuTentitokugou({
    Key key,
    this.titleSeinengappi,
  }) : super(key: key);

  //■■　変数初期設定　■■

  @override
  Widget build(BuildContext context) {
    //■■　画面を生成する　■■

    return Scaffold(
      appBar: AppBar(
        title: Text('天地徳合/干支併臨とは'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('images/anehaturu.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('工事中'),
                Text('　　　　'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('　　　'),
                Text('　　　'),
                Text('　　　'),
                Text('　　　'),
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
            height: 100, //　縦幅の低い端末はこの値を下げる
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
