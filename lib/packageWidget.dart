/**
 * author:
 * time:2019/8/8
 * descript:
 */

import 'package:flutter/material.dart';

import 'customPainter/myPaint.dart';

class PackageWidget extends StatefulWidget {
  @override
  _PackageWidgetState createState() => _PackageWidgetState();
}

class _PackageWidgetState extends State<PackageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("appabar"),),
      body: new Container()
    );
  }
}

