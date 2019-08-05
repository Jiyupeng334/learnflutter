/**
 * author:
 * time:2019/7/31
 * descript:实现listview列表的下拉刷新和下拉加载更多。
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListViewTest extends StatefulWidget {
  @override
  _ListViewState createState() {
    // TODO: implement createState
    return _ListViewState();
  }
}

class _ListViewState extends State<ListViewTest> {
  ScrollController _scrollController;

  bool isLoadMore=false;

  List<String> data=['第1项','第2项','第3项','第4项','第5项','第6项','第7项','第8项','第9项','第10项'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //判断滑动到了最低端
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (this.loadMoreData != null) {
          loadMoreData();
        }
      }
    });
  }

  Widget _buildLoadMoreWidget() {
    Widget bottomWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new SpinKitPumpingHeart(color: Colors.red,),
        new Container(width: 5,),
        new Text("加载中...",style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)
      ],
    );
    return new Padding(padding: const EdgeInsets.all(15),child: new Center(child: bottomWidget,),);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewTest"),
          centerTitle: true,
        ),
        body: new RefreshIndicator(
          child: ListView.builder(
            itemBuilder: itemView,
            itemCount: data.length+1,
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(), //保证list在任何情况下都能滑动
          ),
          onRefresh: onRefreshData,
        ));
  }

  Widget itemView(BuildContext context, int index) {
    if(index==data.length){
      return _buildLoadMoreWidget();
    }else {
      Widget itemView = Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("招聘职位"),
                    Container(
                        child: Text("月薪10000-10000"),
                        alignment: Alignment.centerRight)
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text("公司名称"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text("其他信息:${data[index]}"),
                ),
              ],
            ),
          ));
      return itemView;
    }
  }

  Future<void> onRefreshData() async {
    await Future.delayed(Duration(seconds: 2),(){
      data.clear();
      data=List.generate(10, (index)=>"下拉刷新后：第$index项");
      setState(() {
      });
    });
  }

  void loadMoreData() async{
    await Future.delayed(Duration(seconds: 2),(){
      if(!isLoadMore){
        isLoadMore=true;
        List<String> loadMoreData=List.generate(5, (index)=>"上拉加载后：第$index项");
        data.addAll(loadMoreData);
        setState(() {
          isLoadMore=false;
        });
      }
    });

  }
}
