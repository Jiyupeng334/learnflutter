/**
 * author:
 * time:2019/8/2
 * descript: 语言国际化dart文件
 */

import 'package:flutter/material.dart';
import 'Translations.dart';

class LocalizationTest extends StatefulWidget {
  @override
  _LocalizationTestState createState() => _LocalizationTestState();
}

class _LocalizationTestState extends State<LocalizationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("app_title")),
      ),
      body:Column(
        children: <Widget>[
          Text(Translations.of(context).text("main_title")),
        ],
      ),
    );
  }
}

