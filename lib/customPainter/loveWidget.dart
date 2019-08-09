/**
 * author:
 * time:2019/8/9
 * descript:
 */

import 'package:flutter/material.dart';
import 'myPaint.dart';

class LoveWidget extends StatefulWidget {
  @override
  _LoveWidgetState createState() => _LoveWidgetState();
}

class _LoveWidgetState extends State<LoveWidget>
    with TickerProviderStateMixin {

  AnimationController controllerLeft;
  Animation<double> leftTween;
  AnimationController controllerRight;
  Animation<double> rightTween;
  AnimationController controllerLineLeft;
  Animation<double> lineLeftTween;
  AnimationController controllerLineRight;
  Animation<double> lineRightTween;

  double value=0;
  LoveType loveType=LoveType.LoveLeft;

  @override
  void initState() {
    super.initState();
    loveLeftAnim();
    loveRightAnim();
    lineLeftAnim();
    lineRightAnim();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("love widget"),
      ),
      body: CustomPaint(
        painter: MyPaint(context, value, loveType),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if(controllerLeft!=null){
            controllerLeft.forward();
          }
        },
        icon: Icon(Icons.add),
        label: Text("click me"),
      ),
    );
  }

  void loveLeftAnim() {
    controllerLeft = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    leftTween =
    new Tween(begin: 1.0, end: 225.0).animate(controllerLeft) //返回Animation对象
      ..addListener(() {
        //添加监听
        setState(() {
          value = leftTween.value; //打印补间插值
        });
      });
    controllerLeft.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        controllerRight.forward();
      }
    });
  }

  void loveRightAnim() {
    controllerRight = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    rightTween =
    new Tween(begin: 1.0, end: 225.0).animate(controllerRight) //返回Animation对象
      ..addListener(() {
        //添加监听
        setState(() {
          loveType=LoveType.LoveRight;
          value = rightTween.value; //打印补间插值
        });
      });
    controllerRight.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        controllerLineLeft.forward();
      }
    });
  }

  void lineLeftAnim() {
    controllerLineLeft = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    controllerLineLeft.addListener(() {
        //添加监听
        setState(() {
          loveType=LoveType.LineLeft;
          value = controllerLineLeft.value; //打印补间插值
        });
      });
    controllerLineLeft.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        controllerLineRight.forward();
      }
    });
  }

  void lineRightAnim() {
    controllerLineRight = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    controllerLineRight.addListener((){
      setState(() {
        loveType=LoveType.LineRight;
        value = controllerLineRight.value; //打印补间插值
      });
    });
  }
}
