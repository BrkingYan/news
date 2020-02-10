import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailView extends StatelessWidget{
  final String url;

  NewsDetailView({this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('新闻详情'),
      ),
      body: new WebView(
        initialUrl: url,
      ),
    );
  }
}