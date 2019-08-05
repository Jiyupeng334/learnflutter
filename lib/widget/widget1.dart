/**
 * author:
 * time:2019/7/31
 * descript: tabbar+pageview实现联动
 */

import 'package:flutter/material.dart';
import 'dart:io';

class Widget1 extends StatefulWidget {
  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  List<String> _tabItemList = ['动态', '趋势', '我的'];
  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItemList.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print(_tabController.index);
        onPageChange(_tabController.index, p: _pageController);
      }
    });
  }

  void onPageChange(int index,
      {PageController p, TabController tabController}) async {
    if (p != null) {
      print("p != null");
      isPageCanChanged = false;
      await _pageController.animateToPage(index,
          duration: Duration(milliseconds: 1000), curve: Curves.ease);
      isPageCanChanged = true;
    } else {
      print("p == null");
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("widget1"),
          bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor:Colors.red,
              indicatorColor: Colors.green,
              indicatorWeight: 4.0,
              tabs: _tabItemList.map((item) {
                return Tab(text: item,);
              }).toList()),
        ),
        body: PageView.builder(
          itemCount: _tabItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(_tabItemList[index]);
          },
          controller: _pageController,
          onPageChanged: (index) {
            if(isPageCanChanged){
              onPageChange(index);
            }
          },
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
