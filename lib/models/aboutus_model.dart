class AboutUsModel {
  int id;
  String p1;
  String p2;
  String updatedAt;

  AboutUsModel({this.id, this.p1, this.p2, this.updatedAt});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    p1 = json['p1'];
    p2 = json['p2'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p1'] = this.p1;
    data['p2'] = this.p2;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}