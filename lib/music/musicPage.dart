import 'package:flutter/material.dart';
import 'package:news/news/newsItem.dart';

class MusicPageWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new MusicPageWidgetState();
  }
}

class MusicPageWidgetState extends State<MusicPageWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网易新闻"),
        bottom: TabBar(
          isScrollable: true,
          indicator: const BoxDecoration(),
          labelStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 16.0,),
          tabs: <Widget>[
            Tab(text: "我的"),
            Tab(text: "推荐"),
            Tab(text: "视频"),
          ],
          controller: _tabController,  // 记得要带上tabController
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //新闻
          Center(

          ),
          Center(

          ),
          Center(

          ),
        ],
      ),
    );
  }
}