import 'package:chan_no_sanchusuimei_v3/book_list/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('サインアップ'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: '例：abcd1234@gmail.com',
                    ),
                    controller: mailController,
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'パスワード',
                    ),
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  ElevatedButton(
                    child: Text('登録する'),
                    onPressed: () async {
                      //await model.signUp();
                      await _signUp(model, context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future _signUp(SignUpModel model, BuildContext context) async {
    try {
      await model.signUp();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('登録しました'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }
}
