import './girlPicWidget.dart';
import 'package:flutter/material.dart';

typedef PicRefresh();

class ButtonWidget extends StatefulWidget {
  PicRefresh picRefresh;

  ButtonWidget({this.picRefresh});

  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgetState(picRefresh);
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  PicRefresh picRefresh;

  _ButtonWidgetState(this.picRefresh);

  GlobalKey<GirlPicWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.refresh),
        onPressed: picRefresh,
      ),
    );
  }
}
