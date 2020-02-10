import 'package:flutter/material.dart';
import '../util/loadState.dart';
import 'package:transparent_image/transparent_image.dart';
import 'buttonWidget.dart';
import 'girlPicWidget.dart';
import 'dart:io';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

typedef OnPicCallBack();

class GirlsPageWidget extends StatefulWidget{
  OnPicCallBack _picCallBack;

  @override
  State<StatefulWidget> createState() {
    return new GirlsPageWidgetState();
  }
}

class GirlsPageWidgetState extends State<GirlsPageWidget> with AutomaticKeepAliveClientMixin{

  String url = "https://uploadbeta.com/api/pictures/random/?key=%E6%8E%A8%E5%A5%B3%E9%83%8E";

  GlobalKey<GirlPicWidgetState> _picKey = GlobalKey();

  @override
  void initState() {
    print("girls initState()");
    super.initState();
  }

  _refresh(){
    setState(() {
      
    });
  }


  
  @override
  Widget build(BuildContext context) {
    print("girl.adrt build()");
    return new Scaffold(
        appBar: AppBar(
          title: new Text('美图'),
          actions: <Widget>
          [
            ButtonWidget(
              picRefresh: (){
                _picKey.currentState.onRefresh();
              },
            ),
          ],
        ),
        body: GirlPicWidget(_picKey, url),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
