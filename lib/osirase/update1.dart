//import 'package:admob_flutter/admob_flutter.dart';
//import 'package:chan_no_sanchusuimei_v3/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:chan_no_sanchusuimei_v3/osirase/services/admob.dart';

class Update1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第1版（2021.2.22）'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('■概要'),
          ),
          ListTile(
            title: Text('　生年月日を入力して日干からおおよその性格を表示する'),
          ),
          ListTile(
            title: Text('■四柱推命の観点から'),
          ),
          ListTile(
            title: Text('①　三柱推命'),
          ),
          ListTile(
            title: Text('　一般の四柱推命では、生年月日時　（年柱・月柱・日柱・時柱）から鑑定します。'
                'しかし、一般生活で生まれた時刻を使うことはないため、多くの人は忘れてしまいます。'
                '本アプリは、時柱を使わず、年・月・日を入力して、鑑定します。'),
          ),
          ListTile(
            title: Text('②　日干の算出'),
          ),
          ListTile(
            title: Text('　1900.1.1の日干は、「甲」です。'
                '甲・乙・丙・丁・戊・己・庚・辛・壬・癸の10干において、10日で一巡します。'
                '甲：0、乙：1、・・・壬：8、癸：9　と当てはめると、'
                '1900.1.1から生年月日までの日数を、10で割った余りの数字が、'
                '10干を表す数字になります。'),
          ),
          ListTile(
            title: Text('■プログラムの観点から'),
          ),
          ListTile(
            title: Text('　今回のバージョンで、習得した内容は下記のとおりです。'),
          ),
          ListTile(
            title: Text('①　Flutter開発環境構築'),
          ),
          ListTile(
            title: Text('②　画面に文字や写真を配置する方法'),
          ),
          ListTile(
            title: Text('③　ボタンを押したら画面遷移する方法'),
          ),
          ListTile(
            title: Text('④　生年月日を入力する方法'),
          ),
          ListTile(
            title: Text('⑤　ある期間の日数を算出する方法'),
          ),
          ListTile(
            title: Text('⑥　10で割った余りを算出する方法'),
          ),
          ListTile(
            title: Text('⑦　バナー広告を配置する方法'),
          ),
          ListTile(
            title: Text('⑧  GooglePlayにリリースする方法'),
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
