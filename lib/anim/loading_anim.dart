import 'package:flutter/material.dart';

class LoadingAnim extends StatefulWidget{

  @override
  _LoadingAnimState createState() {
    // TODO: implement createState
    return _LoadingAnimState();
  }

}

class _LoadingAnimState extends State<LoadingAnim> with TickerProviderStateMixin{

  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation<double> _sizeAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 2000),);
    _curvedAnimation=CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
    _sizeAnim=Tween(begin: 200.0,end: 20.0,).animate(_curvedAnimation);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("loading_anim"),),
      body: Container(
        width: _sizeAnim.value,
        height: _sizeAnim.value,
        child: FlutterLogo(),
      ),
    );
  }

}