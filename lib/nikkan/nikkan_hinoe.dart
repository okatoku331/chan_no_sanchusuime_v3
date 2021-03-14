import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/admob.dart';

class NikkanHinoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日干：丙（ひのえ)'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('　日干が丙の人は、太陽にたとえられる性質を持っています。'),
            ),
            ListTile(
              title: Image.asset('images/丙_太陽.jpg'),
            ),
            ListTile(
              title: Text('　太陽は明るく輝き世界を照らしています。ですから、心が広くて小さなことに'
                  'はこだわらず、元気で明るくハツラツとしています。'),
            ),
            ListTile(
              title: Text('　情熱的で感情が豊かです。太陽が沈んでも、また翌朝、日が昇るように、気性'
                  'はさっぱりとしていてしつこくなく、執着心は弱いほうです。嫌なことが'
                  'あったとしても基本的に一晩寝たら忘れてしまうでしょう。お金にも執着'
                  'はなく、気前がよくて何かと浪費しがちです。'),
            ),
            ListTile(
              title: Image.asset('images/丙_朝日.jpg'),
            ),
            ListTile(
              title: Text('　日が射すと、すべての物が白日の下にさらされるように、開けっぴろげで隠'
                  'し事はできないたちで、他人から見ると、とてもわかりやすい人です。内'
                  '緒にしてもすぐにばれてしまうでしょう。'),
            ),
            ListTile(
              title: Text('　親切で寛大な性格で、人から好感を持たれます。活動的で積極的です。太陽'
                  'がどこからでも見えるように、どこにいても目立ちます。行動は速いです'
                  'が、短気で早合点するような、せっかちな面もあります。何事も結論を急'
                  'ぎ、はっきりとさせたがります。'),
            ),
            ListTile(
              title: Text('　そのときの感情によって一喜一憂するような、気分屋なところもあります。'
                  'いばったり、情深くなったり、気分にムラが目立ちます。'),
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
