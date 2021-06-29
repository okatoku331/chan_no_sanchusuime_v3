
import 'package:flutter/foundation.dart';

class MainModel extends ChangeNotifier {
  String kboyText = 'KBOY';

  void changeKboyText(){
    kboyText = 'KBOYさんかっこいい!!!';
    notifyListeners();//変更したことを通知する
  }
}