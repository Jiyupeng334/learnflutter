import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class Anim1 extends StatefulWidget {
  @override
  _Anim1State createState() {
    // TODO: implement createState
    return _Anim1State();
  }
}

class _Anim1State extends State<Anim1> with TickerProviderStateMixin{

  bool forward = true;

  AnimationController controller;
  CurvedAnimation curvedAnimation;
  Animation<double> sizeTween;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curvedAnimation=CurvedAnimation(parent: controller, curve: Curves.linear);
    /*创建补间对象*/
    sizeTween = new Tween(begin: 10.0, end: 100.0)
        .animate(curvedAnimation)    //返回Animation对象
      ..addListener(() {        //添加监听
        setState(() {
          print(sizeTween.value);   //打印补间插值
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("animation"),
      ),
      body:Stack(
        children: <Widget>[
          Positioned(left: 0,top: 0,width: sizeTween.value,height: sizeTween.value,child:FlutterLogo(),),
          Center(
            child: InkWell(
              child: Text("click me"),
              onTap: (){
                if(controller.status==AnimationStatus.completed){
                  controller.reverse();
                }
                if(controller.status==AnimationStatus.dismissed){
                  controller.forward();
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (forward)
          controller.forward(); //向前播放动画
        else
          controller.reverse(); //向后播放动画
        forward = !forward;
      }),
    );
  }
}
