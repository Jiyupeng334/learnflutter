/**
 * author:
 * time:2019/7/30
 * descript:抖动的字
 */

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

class FlutterText extends StatefulWidget {

  var str;
  var style;
  FlutterText(this.str, this.style);

  @override
  _FlutterTextState createState() {
    return _FlutterTextState();
  }

}

class _FlutterTextState extends State<FlutterText> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    animation=new TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0,end: 15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 15,end: 0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0,end: -15), weight: 3),
      TweenSequenceItem(tween: Tween(begin: -15,end: 0), weight: 4),
    ]).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            if(controller.status==AnimationStatus.completed){
              controller.reverse();
            }else{
              controller.forward();
            }
            }, icon: Icon(Icons.add), label: Text("label"))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: AnimateWidget(animation: animation,),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

class AnimateWidget extends AnimatedWidget{
  AnimateWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation=listenable;
    var result=Transform(transform: Matrix4.rotationZ(animation.value * pi / 180),
    alignment: Alignment.center,
    child: Text(
      "劫",
          style: TextStyle(fontSize: 50),
    ),);
    // TODO: implement build
    return result;
  }

}