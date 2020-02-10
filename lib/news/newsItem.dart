import 'package:flutter/material.dart';
import '../model/news/NewsInfo.dart';
import '../util/touchCallBack.dart';
import 'package:date_format/date_format.dart';
import 'dart:ui';
import 'package:webview_flutter/webview_flutter.dart';
import './newsDetail.dart';

class NewsItemWidget extends StatelessWidget{

  final NewsInfo newsInfo;

  final screenSize = window.physicalSize;

  NewsItemWidget(this.newsInfo);

  Widget get _cellContentView{
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(newsInfo.title,
                style: TextStyle(fontSize: 16.0,color: Color(0xff111111)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                    Container(
                      //width: 50.0,
                      height: 20.0,
                      margin: EdgeInsets.only(top: 15.0),
                      child: ButtonTheme(
                        buttonColor: Color(0xff1C64CF),
                        shape: StadiumBorder(),
                        child: RaisedButton(
                          padding: EdgeInsets.all(2.0),
                          child: Text(newsInfo.source,
                            style: TextStyle(color: Colors.white,fontSize: 11.0,fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.centerRight,
                        child: Container(
                          height: 20.0,
                          margin: EdgeInsets.only(top: 15.0),
                          child: Text(newsInfo.date.substring(5,16)),
                        ),
                      ),
                    ),
                  ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          height: 85.0,
          width: 115.0,
          margin: EdgeInsets.only(top: 3.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  image: NetworkImage(newsInfo.imgUrl),
                  fit: BoxFit.cover
              )
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 115.0,
      child: TouchCallBack(
        onPressed: (){
          //处理新闻被点击的事件
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return NewsDetailView(
              url: newsInfo.skipUrl,
            );
            /*return WebView(
              initialUrl: newsInfo.skipUrl,//android:usesCleartextTraffic="true"
            );*/
          }));
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
              child: _cellContentView,
            ),
            //分割线
            Container(
              margin: EdgeInsets.only(top: 4.0),
              color: Color(0xffeaeaea),
              constraints: BoxConstraints.expand(height: 4.0),
            )
          ],
        ),
      ),
    );
  }
}
