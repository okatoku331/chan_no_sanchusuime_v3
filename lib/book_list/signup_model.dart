import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  String eCode = 'OK';
  bool isSignUp = false;

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力して下さい');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力して下さい');
    }
    try {
      //UserCredential user =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: password);
      FirebaseFirestore.instance.collection('users').add({
        'email': mail,
        'createdAT': Timestamp.now(),
      });
      isSignUp = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        eCode = '提供されたパスワードが弱すぎます';
        print('■■■■■■■■■The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        eCode = 'そのメールのアカウントはすでに存在しています';
        print('■■■■■■■■■The account already exists for that email.');
      }
    } catch (e) {
      eCode = e.code;
      print(e);
      print('■■■■■■■■■e■■■■■■■■■');
    }
    notifyListeners();
    print('■■■■■■■■■isSignUp:$isSignUp');
    //eCode = e.code;
    return isSignUp;
  }
}
