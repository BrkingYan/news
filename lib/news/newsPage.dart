import 'package:flutter/material.dart';
import 'package:news/news/newsItem.dart';
import './oneTypeNews.dart';

class NewsPageWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new NewsPageWidgetState();
  }
}

class NewsPageWidgetState extends State<NewsPageWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 13,vsync: this);
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
          tabs: <Widget>[
            Tab(text: "新闻"),
            Tab(text: "娱乐"),
            Tab(text: "体育"),
            Tab(text: "财经"),
            Tab(text: "军事"),
            Tab(text: "科技"),
            Tab(text: "手机"),
            Tab(text: "数码"),
            Tab(text: "时尚"),
            Tab(text: "游戏"),
            Tab(text: "教育"),
            Tab(text: "健康"),
            Tab(text: "旅游"),
          ],
          controller: _tabController,  // 记得要带上tabController
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //新闻
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BBM54PGAwangning/0-10.html",
          ),
          //娱乐
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA10TA81wangning/0-10.html",
          ),
          //体育
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA8E6OEOwangning/1-10.html",
          ),
          //财经
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA8EE5GMwangning/1-10.html",
          ),
          //军事
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BAI67OGGwangning/1-10.html",
          ),
          //科技
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA8D4A3Rwangning/1-10.html",
          ),
          //手机
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BAI6I0O5wangning/1-10.html",
          ),
          //数码
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BAI6JOD9wangning/1-10.html",
          ),
          //时尚
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA8F6ICNwangning/1-10.html",
          ),
          //游戏
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BAI6RHDKwangning/1-10.html",
          ),
          //教育
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BA8FF5PRwangning/1-10.html",
          ),
          //健康
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BDC4QSV3wangning/1-10.html",
          ),
          //旅游
          OneTypeNews(
            url: "https://3g.163.com/touch/reconstruct/article/list/BEO4GINLwangning/1-10.html",
          ),
        ],
      ),
    );
  }
}