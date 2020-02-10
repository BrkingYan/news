import 'package:flutter/material.dart';
import 'package:news/news/newsPage.dart';
import 'package:news/music/musicPage.dart';
import 'package:news/girl/girls.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new BottomNavigationWidget()
    );
  }
}

class BottomNavigationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> with AutomaticKeepAliveClientMixin{
  int _currentIndex = 0;
  List<Widget> _pages = new List();
  var _pageController = PageController();

  @override
  // ignore: must_call_super
  void initState() { //初始化状态
    _pages
      ..add(NewsPageWidget())
      ..add(MusicPageWidget())
      ..add(GirlsPageWidget());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: SafeArea(
        child: PageView.builder(
          //禁止左右滑动切换页面
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _pageChanged,
          //回调函数
          itemCount: _pages.length,
          itemBuilder: (context,index) => _pages[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:
      [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: new Text('新闻')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_video),
          title: new Text('影音')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.pregnant_woman),
            title: new Text('美女')
        ),
      ],
        currentIndex: _currentIndex,
        onTap: (int index){
            setState(() {
              _pageController.jumpToPage(index);
            });
        },
      ),
    );
  }

  void _pageChanged(int index){
    setState(() {
      if(_currentIndex != index) _currentIndex = index;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}