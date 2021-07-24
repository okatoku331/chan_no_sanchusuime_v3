import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力して下さい');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力して下さい');
    }

    final result =
        await _auth.signInWithEmailAndPassword(email: mail, password: password);
    final uid = result.user.uid;
    print('■■■■■■■■uid:$uid');
    //TODO:端末に保存

    notifyListeners();
  }
}
