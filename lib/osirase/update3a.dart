import 'package:chan_no_sanchusuimei_v3/osirase/consept.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Update3a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '第3.1版（2022.4.18）',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('■概要'),
          ),
          ListTile(
            title:
                Text('１．アプリのコンセプトを、「占い」から、「易占の学習」に変更した。それにともない、ホームページのデザインを変更'),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: ElevatedButton(
                child: Text('アプリのコンセプト詳細'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Consept(),
                      ));
                },
              ),
            ),
          ),
          ListTile(
            title: Text('２．全体の表示をダークモードにして、今日の運勢のページを見やすくした。'),
          ),
          ListTile(
            title: Text(''),
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
