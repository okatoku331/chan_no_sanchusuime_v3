import 'package:admob_flutter/admob_flutter.dart';
import 'package:chan_no_sanchusuimei_v3/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:chan_no_sanchusuimei_v3/osirase/services/admob.dart';

class Update2a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第2.1版（2021.4.18）'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('■概要'),
          ),
          ListTile(
            title: Text('天地徳合/干支併臨 画面でnullが表示されるのを修正'),
          ),
          ListTile(
            title: Text('挿絵のサイズを調整'),
          ),
          ListTile(
            title: Text(''),
          ),
          AdmobBanner(
              adUnitId: AdMobService().getBannerAdUnitId(),
              adSize: AdmobBannerSize(
                width: MediaQuery.of(context).size.width.toInt(),
                height: AdMobService().getHeight(context).toInt(),
                name: 'SMART_BANNER',
              )),
          ListTile(
            title: Text(''),
          ),
          ElevatedButton(
            child: Text('戻る'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
