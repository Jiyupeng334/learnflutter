/**
 * author:
 * time:2019/7/30
 * descript:
 */

import 'package:flutter/material.dart';

class Test extends StatefulWidget {

  @override
  _TestState createState() {
    // TODO: implement createState
    return _TestState();
  }

}

class _TestState extends State<Test> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("test"),),
      body: GestureDetector(
          onTap: () {
            print("onTap in my box");
          },
          onTapDown: (pos) {
            print(
                "落点----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
          },
          onTapUp: (pos) {
            print(
                "抬起点----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
          },
          onTapCancel: () {
            print("onTapCancel in my box");
          },
          onDoubleTap: () {
            print("onDoubleTap in my box");
          },
          onLongPress: () {
            print("onLongPress in my box");
          },
          onLongPressUp: () {
            print("onLongPressUp in my box");      },
//          onVerticalDragDown: (pos) {
//            print(
//                "竖直拖拽按下----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//          },
//          onVerticalDragStart: (pos) {
//            print(
//                "开始竖直拖拽----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//          },
//          onVerticalDragUpdate: (pos) {
//            print(
//                "竖直拖拽更新----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//          },
//          onVerticalDragEnd: (pos) {
//            print(
//                "竖直拖拽结束速度----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
//          },
//          onVerticalDragCancel: () {
//            print("onVerticalDragCancel in my box");
//          },
//        onHorizontalDragCancel: (){
//          print("onHorizontalDragCancel in my box");
//        },
//        onHorizontalDragDown: (pos) {
//          print(
//              "水平拖拽按下----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//        },
//        onHorizontalDragStart: (pos) {
//          print(
//              "开始水平拖拽----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//        },
//        onHorizontalDragUpdate: (pos) {
//          print(
//              "水平拖拽更新----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");
//        },
//        onHorizontalDragEnd: (pos) {
//          print(
//              "水平拖拽结束速度----(x,y):(${pos.velocity.pixelsPerSecond.dx},${pos.velocity.pixelsPerSecond.dy})");
//        },
        onPanDown: (pos){print(
            "onPanDown----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");},
        onPanUpdate: (pos){print(
            "onPanUpdate----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");},
        onPanStart: (pos){print(
            "onPanStart----(x,y):(${pos.globalPosition.dx},${pos.globalPosition.dy})");},
        onPanEnd: (detail){print(
            "onPanEnd----${detail.toString()}");},
        onPanCancel: (){print("onPanCancel=---");},
        child: Container(
          child: Text("test"),
          width: width,
          height: height,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}