/**
 * author:
 * time:2019/8/7
 * descript:
 */

import 'package:flutter/material.dart';
import 'textView.dart';

class TextTestWidget extends StatefulWidget {
  @override
  _TextTestWidgetState createState() => _TextTestWidgetState();
}

class _TextTestWidgetState extends State<TextTestWidget> {

  TextViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("appbar"),leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
        if(_controller!=null){
          _controller.setText("appbar");
        }
      }),),
      body: TextViewWidget(onTextViewCreated: (controller){
        _controller=controller;
      },),
    );
  }
}

