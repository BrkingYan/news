class Imgextra {
  String imgsrc;

  Imgextra({this.imgsrc});

  Imgextra.fromJson(Map<String, dynamic> json) {
    imgsrc = json['imgsrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgsrc'] = this.imgsrc;
    return data;
  }
}