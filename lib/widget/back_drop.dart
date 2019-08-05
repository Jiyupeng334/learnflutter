import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

//高斯模糊效果
class BackDropPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: 400,
          height: 600,
          alignment: Alignment.center,
          child: InkWell(child: Text("texttexttexttexttexttexttexttexttexttexttexttext"),onTap: (){},),
        ),
      ),
    );;
  }

}