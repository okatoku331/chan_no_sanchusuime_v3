import 'package:flutter/cupertino.dart';

class InputModel extends ChangeNotifier {
  int nikkan = -1;

  String nikannText = '？';

  void changNikkan(nikkan, nikkanText) {
    nikkan = nikkan;
    nikannText = ' $nikkan';
    print('c$nikkan');
    notifyListeners();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
