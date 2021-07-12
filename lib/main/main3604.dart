import 'package:chan_no_sanchusuimei_v3/book_list/book_list_page.dart';
import 'package:chan_no_sanchusuimei_v3/book_list/book_list_page1.dart';
import 'package:chan_no_sanchusuimei_v3/main/main_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main3604() async {
  // FireBase core 0.5.0 以降ここで初期化することが必要
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // 追加以上
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final String kboyText = 'KBOY';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Providerパターン'),
          ),
          body: Consumer<MainModel>(
              //stream: null,
              builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    model.kboyText,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //TODO: ここで何かをする
                      //model.changeKboyText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookListPage()),
                      );
                    },
                    child: Text('ボタン'),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
