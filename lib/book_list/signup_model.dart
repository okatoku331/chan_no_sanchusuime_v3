import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    //TODO:
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: mail);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    FirebaseFirestore.instance.collection('users').add({
      'email': mail,
      'createdAT': Timestamp.now(),
    });
    notifyListeners();
  }
}
