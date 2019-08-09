/**
 * author:
 * time:2019/8/8
 * descript:
 */

import 'package:flutter/material.dart';

import 'cusLayout.dart';


class ExportCusLayout extends StatefulWidget {
  @override
  _ExportCusLayoutState createState() => _ExportCusLayoutState();
}

class _ExportCusLayoutState extends State<ExportCusLayout> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("app bar"),),
      body: Container(
        child: CustomLayout(),
      ),
    );
  }
}
