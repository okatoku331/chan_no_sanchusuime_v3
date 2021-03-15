import 'dart:io';
import 'package:flutter/material.dart';

class AdMobService {
  String getBannerAdUnitId() {
    // iOSとAndroidで広告ユニットIDを分岐させる
    if (Platform.isAndroid) {
      // Androidの広告ユニットID
      // 　　　ca-app-pub-3940256099942544/6300978111　test用 広告ユニットID：
      //      ca-app-pub-6197150911254354/6910840748  本番用　広告ユニットID：
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // iOSの広告ユニットID
      //      ca-app-pub-3940256099942544/2934735716　test用 広告ユニットID：
      //      ca-app-pub-6197150911254354/8637488407  本番用　広告ユニットID：
      return 'ca-app-pub-6197150911254354/8637488407';
    }
    return null;
  }

  // 表示するバナー広告の高さを計算
  double getHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final percent = (height * 0.06).toDouble();

    return percent;
  }
}
