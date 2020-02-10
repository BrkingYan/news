import './Imgextra.dart';

class Inter {
  List<Imgextra> imgextra;
  //Null liveInfo;
  //tring docid;
  String source;
  String title;
  int priority;
  String url;
  String skipURL;
  int commentCount;
  String imgsrc3gtype;
  String stitle;
  String digest;
  String skipType;
  String photosetID;
  String imgsrc;
  String ptime;
  String modelmode;
  int hasImg;
  String imgsrcFrom;

  Inter(
      {this.imgextra,
        //this.liveInfo,
        //this.docid,
        this.source,
        this.title,
        this.priority,
        this.url,
        this.skipURL,
        this.commentCount,
        this.imgsrc3gtype,
        this.stitle,
        this.digest,
        this.skipType,
        this.photosetID,
        this.imgsrc,
        this.ptime,
        this.modelmode,
        this.hasImg,
        this.imgsrcFrom});

  Inter.fromJson(Map<String, dynamic> json) {
    if (json['imgextra'] != null) {
      imgextra = new List<Imgextra>();
      json['imgextra'].forEach((v) {
        imgextra.add(new Imgextra.fromJson(v));
      });
    }
    //liveInfo = json['liveInfo'];
    //docid = json['docid'];
    source = json['source'];
    title = json['title'];
    priority = json['priority'];
    url = json['url'];
    skipURL = json['skipURL'];
    commentCount = json['commentCount'];
    imgsrc3gtype = json['imgsrc3gtype'];
    stitle = json['stitle'];
    digest = json['digest'];
    skipType = json['skipType'];
    photosetID = json['photosetID'];
    imgsrc = json['imgsrc'];
    ptime = json['ptime'];
    modelmode = json['modelmode'];
    hasImg = json['hasImg'];
    imgsrcFrom = json['imgsrcFrom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imgextra != null) {
      data['imgextra'] = this.imgextra.map((v) => v.toJson()).toList();
    }
    //data['liveInfo'] = this.liveInfo;
    //data['docid'] = this.docid;
    data['source'] = this.source;
    data['title'] = this.title;
    data['priority'] = this.priority;
    data['url'] = this.url;
    data['skipURL'] = this.skipURL;
    data['commentCount'] = this.commentCount;
    data['imgsrc3gtype'] = this.imgsrc3gtype;
    data['stitle'] = this.stitle;
    data['digest'] = this.digest;
    data['skipType'] = this.skipType;
    data['photosetID'] = this.photosetID;
    data['imgsrc'] = this.imgsrc;
    data['ptime'] = this.ptime;
    data['modelmode'] = this.modelmode;
    data['hasImg'] = this.hasImg;
    data['imgsrcFrom'] = this.imgsrcFrom;
    return data;
  }
}
