import 'package:chan_no_sanchusuimei_v3/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String kboyText = 'KBOY';
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
                        onPressed: (){
                          //TODO: ここで何かをする
                          model.changeKboyText();
                        },
                        child: Text('ボタン'),
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
