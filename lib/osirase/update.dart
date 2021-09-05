import 'package:chan_no_sanchusuimei_v3/osirase/update1.dart';
import 'package:chan_no_sanchusuimei_v3/osirase/update2a.dart';
import 'package:chan_no_sanchusuimei_v3/osirase/update3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'jiko_syoukai.dart';
import 'update2.dart';

class Update extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アップデート情報'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                        '第3版　今日の運勢がわかるようになりました。「易占検定」を追加しました。（2021/8/8 更新)'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update3(),
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('第2.1版　軽微な修正（2021/4/18 更新)'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update2a(),
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('第2版　天運の年がわかるようになりました。（2021/3/31 更新)'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update2(),
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                        '第1版　生年月日を入力し、日干を算出し、おおよその性格を表示します。(2021/2/22 公開)'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update1(),
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('プロフィール'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JikoSyoukai(),
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                //ListTile(
                //  title: Text(' '),
                //),
                /*AdmobBanner(
                    adUnitId: AdMobService().getBannerAdUnitId(),
                    adSize: AdmobBannerSize(
                      width: MediaQuery.of(context).size.width.toInt(),
                      height: AdMobService().getHeight(context).toInt(),
                      name: 'SMART_BANNER',
                    )),*/
                //ListTile(
                //  title: Text(''),
                //),
                ElevatedButton(
                  child: Text('戻る'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 8,
          ),

          //バナー広告追加
          //if (banner == null)
          SizedBox(height: 50), // Ads
          //else
          // SizedBox(
          //   height: 50,
          //  child: AdWidget(ad: banner),
          // ),

          //バナー広告ここまで

          Container(
            height: 30,
          ),
        ],
      ),
    );
  }
}
