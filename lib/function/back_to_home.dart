/**
 * author:
 * time:2019/8/5
 * descript:实现功能：Android手机返回键返回到桌面而不是退出app
 */

import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'dart:io';

class BackToHome extends StatefulWidget {
  @override
  _BackToHomeState createState() => _BackToHomeState();
}

class _BackToHomeState extends State<BackToHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("BackToHome"),),
      body: WillPopScope(child: Container(child: Text("BackToHome"),), onWillPop: _backToHome),
    );
  }

  Future<bool> _backToHome() async{
    if(Platform.isAndroid){
        AndroidIntent androidIntent=AndroidIntent(action: 'android.intent.action.MAIN',category: "android.intent.category.HOME");
        await androidIntent.launch();
    }
    return Future.value(false);
  }


}

