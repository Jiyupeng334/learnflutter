import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//此文件为flutter与android交互代码

 const  String CHANNEL="com.flutter.list/plugin";//定义的通道
 const  playform=const MethodChannel(CHANNEL);


class Interact extends StatefulWidget{
  @override
  _InteractState createState() {
    return _InteractState();
  }
  
}


class _InteractState extends State<Interact>{

  String result1=null;
  String result2=null;
  String result3=null;

  @override
  void initState() {
    super.initState();
  }

  _sendMSGtoToast() async{
      String result =await playform.invokeMethod("toast");
      this.setState((){
        result1=result;
      });
  }

  Future<String>_sendArgumtoAndroid(String params) async{
    Map<String,String> map= { "flutter": "这是一条来自flutter的参数" };
    return await playform.invokeMethod("getAragums",{ "flutter": params });
//    this.setState((){
//      result2=result;
//    });
  }

  _sendArgumtAndJump() async{
    String result =await playform.invokeMethod("jump","jump activity");
  }

  sendMoreMessage(){
    _sendArgumtoAndroid("params1");
    _sendArgumtoAndroid("params2");
    _sendArgumtoAndroid("params3");
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("与android交互界面"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: _sendMSGtoToast,child: Text("点击调用Android toast")),
            RaisedButton(onPressed:sendMoreMessage,child:Text("点击发送参数")),
            RaisedButton(onPressed: _sendArgumtAndJump,child: Text("点击发送数据并进行Android界面跳转"),),
            Text("第一个回调信息：$result1"),
            Text("第二个回调信息：$result2"),
            Text("第三个回调信息：$result3"),
          ],
        ),
      )
      );
  }
  
}