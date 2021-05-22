//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../services/admob.dart';

class NikkanMizunoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //アップバーを配置する
        title: Text('日干：癸（みずのと）'), //アップバーの
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('　日干が癸に人は、雨水や雲にたとえられる性質をもっています。'),
            ),
            ListTile(
              title: Image.asset('images/nikkan/癸_雲雨.jpg'),
            ),
            ListTile(
              title: Text('　雨水はしとしとと大地に降り、土壌に静かに浸透していきます。ですから、穏や'
                  'かで物静か、繊細で柔らかな人です。生活の潤いを重んじ、夢のある暮らし'
                  'や、繊細な気持ちを大切にします。'),
            ),
            ListTile(
              title: Text('　雨が降って清められるように、潔癖で正直者です。雨水が上から下へと落ちて'
                  'くるように、原則を重んじるタイプで、規則や道徳を守ります。小さな水の'
                  '粒が絶え間なく降り注ぎ次第に水たまりになるように、勤勉でまじめです。'
                  'コツコツと堅実な努力を重ね、忍耐力を備えています。'),
            ),
            ListTile(
              title: Image.asset('images/nikkan/癸_潤う.jpg'),
            ),
            ListTile(
              title: Text('　雨水が天（空）から降りてくるように、想像力に富み、純粋で神経質なところが'
                  'あり、空想や妄想にふけるような面を持っています。'),
            ),
            ListTile(
              title: Text('　雲がかかるように、内向的で気が小さいほうで、つまらないことをいつまでも'
                  '気にしたり、雲が風に流れていくように、周りの状況に振り回されたりしや'
                  'すいでしょう。'),
            ),
            ListTile(
              title: Text('　小さな水の粒は涙に通じ、情にもろく、暖かく、親切な人柄です。'),
            ),
            ListTile(
              title: Text('　あれこれと物事にこだわるほうなので、考えは悲観的になりやすく、物事を悪'
                  'いほうへ解釈しやすい面もあります。しかし、苦しいことに耐える力があり'
                  'ます。'),
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
      ),
    );
  }
}
