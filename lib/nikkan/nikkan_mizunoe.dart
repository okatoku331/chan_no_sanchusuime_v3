import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/admob.dart';

class NikkanMizunoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日干：壬（みずのえ）'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('　日干が壬の人は、海や大河にたとえられる性質をもっています。'),
            ),
            ListTile(
              title: Image.asset('images/壬_海.jpg'),
            ),
            ListTile(
              title: Text('　海原はどこまでも広がり、ゆったりと水を満たしています。ですから、楽観的に'
                  'おおらかに物事を見ています。大河がより低い箇所を見つめて流れていく'
                  'ように、過去にはこだわらず悠々としていて、海にいろいろなものが流れて'
                  'くるように、多くのものを容認する包容力があります。'),
            ),
            ListTile(
              title: Text('　水は動くことを通して生きた水になるように、よく動き、外交的で世話好きで'
                  'す。苦労性な面はありますが、どこへいっても元気で目立ちます。'),
            ),
            ListTile(
              title: Text('　　水は、自分の形を持たず、器に合わせて瞬時に形を変えるように、知恵にあ'
                  'ふれ、頭の回転が速く、大変に聡明です。チャンスが来るのを待ち、臨機応'
                  '変に対処し、タイミングを逃しません。'),
            ),
            ListTile(
              title: Image.asset('images/壬_支流.jpg'),
            ),
            ListTile(
              title: Text('　小さな川がまとまりやがて海という目標にむかって一つになって流れていく'
                  'ように、責任感があり、リーダーシップも発揮し、親切です。自分自身の形'
                  'を持たないぶん、人任せにし、怠惰なところがあり、人に依存しやすい面も'
                  'あります。'),
            ),
            ListTile(
              title: Text('　自由を好み、束縛を嫌いますから、多くの人とつき合い、異性とはくっついた'
                  'り離れたりしがちです。水の性質から、勢いに任せてしまうようなところ'
                  'があり、意志が変わりやすいでしょう。'),
            ),
            ListTile(
              title: Text(''),
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
            RaisedButton(
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
