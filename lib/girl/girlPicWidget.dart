import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class GirlPicWidget extends StatefulWidget{
  String url;

  GirlPicWidget(Key key,this.url) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("girlsWidget create()");
    return GirlPicWidgetState(url: url);
  }
}

class GirlPicWidgetState extends State<GirlPicWidget> with AutomaticKeepAliveClientMixin{

  var girlPic;
  String url;
  String url2 = "https://api.ooopn.com/image/beauty/api.php?type=json";
  String imgUrl;
  bool urlFlag = true;

  final String netErrorImg = "images/netError.png";

  final Widget netErrorPage = new Center(
    child: new Column(
      children: <Widget>
      [
        new Center(child: Image.asset("images/netError.png"),),
        new Center(child: new Text("网络异常"),)
      ],
    ),
  );

  GirlPicWidgetState({this.url});

  List<Widget> list = new List();

  final WebView webView = new WebView(initialUrl: "",);


  Future getData() async {
    var client = new HttpClient();
    var request = await client.getUrl(Uri.parse(url2));
    var response = await request.close();
    String jsonStr = await response.transform(Utf8Decoder()).join();

    Map<String,dynamic> map = json.decode(jsonStr);
    imgUrl = map['imgurl'];
    print(imgUrl);
  }

  @override
  void initState() {
    print("girlsWidget initState()");

    if(list.isEmpty != true){
      list.clear();
    }
    getData().then((_){
      setState(() {
        list.add(new Center(
          child: CircularProgressIndicator(),
        ));
        list.add(new Center(
          child: Image.network(imgUrl),
        ));
      });
    }).catchError((_){
      print("catchError in initState()");
      setState(() {
        list.add(netErrorPage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("girlsWidget build()");
    // TODO: implement build
    return new Center(
      child: new Stack(
        children: <Widget>
        [
          new Stack(
            children: list,
          ),
          new Align(
            child: Icon(Icons.favorite_border,size: 50.0,),
            alignment: Alignment.bottomRight,
          )
        ],
      ),
    );
  }

  void onRefresh(){
    print("onRefresh()");
    setState(() {
      list.clear();
    });
    getData().then((_){
      setState(() {
        list.add(new Center(
          child: CircularProgressIndicator(),
        ));
        list.add(new Center(
          child: Image.network(imgUrl),
        ));
        print("after onRefresh:" + list.toString());
      });
    }).catchError((_){
      print("catchError in onRefresh()");
      setState(() {
        list.add(netErrorPage);
      });
    });
  }

  _savePic() async {
    //ByteData response =
    /*var response = await Dio().get(imgUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));*/
    Response response;
    Dio dio = new Dio();
    response = await dio.get(imgUrl);
    await dio.download(response.data,"/storage/emulated/0/DCIM/" + "av" +  ".jpg");
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}