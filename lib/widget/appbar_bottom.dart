/**
 * author:
 * time:2019/8/2
 * descript:测试appbar的bottom属性添加搜索框
 */

import 'package:flutter/material.dart';
import 'search_bar.dart';

class AppBarBottom extends StatefulWidget {
  @override
  _AppBarBottomState createState() => _AppBarBottomState();
}

class _AppBarBottomState extends State<AppBarBottom> {

  TextEditingController _controller;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBarBottom"),
        bottom: SearchWidget(
          onAttach: (controller){
            _controller=controller;
            print("onAttach");
          },
        ),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){if(_controller!=null){_controller.clear();}},child: Text("click me"),),
      ),
    );
  }
}



