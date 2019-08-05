/**
 * author:
 * time:2019/8/2
 * descript: 编写一个可以在appbar的bottom属性里边的搜索栏，和appbar_bottom.dart一起使用
 */

import 'package:flutter/material.dart';

typedef VoidCallback<TextEditingController> = void Function(TextEditingController controller);

class SearchWidget extends StatefulWidget implements PreferredSizeWidget {

  double height;

  VoidCallback<TextEditingController> onAttach;

  SearchWidget({this.onAttach,Key key,this.height=30}):assert(onAttach!=null),super(key:key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();

  @override
  Size get preferredSize {
    if(height<=0){
     height=30;
    }
    return Size.fromHeight(height);}
}

class _SearchWidgetState extends State<SearchWidget> {

  TextEditingController _editingController=new TextEditingController();

  FocusNode focusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    widget.onAttach(_editingController);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        focusNode:focusNode,
        controller: _editingController,
        decoration: new InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: "搜索",
        ),
        onSubmitted: (value){
          print("onSubmitted:value=$value");
          focusNode.unfocus();
          },
        onChanged: (value){print("onChanged:value=$value");},
        onEditingComplete: (){
          print("onEditingComplete");
          focusNode.unfocus();},
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editingController.dispose();
    super.dispose();
  }

}
