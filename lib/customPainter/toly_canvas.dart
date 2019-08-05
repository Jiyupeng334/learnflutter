/**
 * author:
 * time:2019/7/26
 * descript:画布的widget类
 */
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

import 'paper.dart';

class TolyCanvas extends StatefulWidget {

  @override
  _TolyCanvasState createState() {
    // TODO: implement createState
    return _TolyCanvasState();
  }

}

class _TolyCanvasState extends State<TolyCanvas> {

  var _positions=<TolyCircle>[];
  var _lines=<List<TolyCircle>>[];
  Offset _oldPos;//记录上一点

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body=CustomPaint(
      painter: Paper(lines: _lines),
    );
    var scaffold=Scaffold(
      body: body,
    );
    var result=GestureDetector(
      child: scaffold,
        onPanDown: _panDown,
        onPanUpdate: _panUpdate,
        onPanEnd: _panEnd,
        onDoubleTap: (){
          _lines.clear();
          _render();
        },
    );
    // TODO: implement build
    return result;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  void _panUpdate(DragUpdateDetails details) {
    var x=details.globalPosition.dx;
    var y=details.globalPosition.dy;
    var curPos=Offset(x,y);
    if((curPos-_oldPos).distance>3){
      var len=(curPos-_oldPos).distance;
      var width=40*pow(len,-1.2);
      var tolyCircle=TolyCircle(Colors.black, curPos,radius: width);
      _positions.add(tolyCircle);
      _oldPos=curPos;
      _render();
    }
  }

  void _panDown(DragDownDetails details) {
    print("_panDown");
    _lines.add(_positions);
    _oldPos=Offset(details.globalPosition.dx, details.globalPosition.dy);
  }

  void _panEnd(DragEndDetails details) {
    print("_panEnd");
    var oldBall = <TolyCircle>[];
    for (int i = 0; i < _positions.length; i++) {
      oldBall.add(_positions[i]);
    }
    _lines.add(oldBall);
    _positions.clear();
  }

  void _render() {
    if(this.mounted){
      setState(() {

      });
    }
  }
}
