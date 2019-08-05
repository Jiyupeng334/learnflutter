import 'package:flutter/material.dart';

class DialogTwo extends StatefulWidget{

  @override
  _DialogTwoState createState() {
    // TODO: implement createState
    return _DialogTwoState();
  }

}

class _DialogTwoState extends State<DialogTwo>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("texttexttexttexttexttexttexttexttexttexttexttexttexttexttext"),
      decoration: BoxDecoration(color: Colors.transparent,boxShadow: [BoxShadow(color: Colors.transparent)]),
    );
  }

}