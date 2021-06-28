class SirenDetails {
  String name;
  String audio;
  String image;
  String audio1;
  String audio2;
  String audio3;
  String audio4;
  String audio5;
  String audio6;
  String audio7;
  String audio8;
  String name1;
  String name2;
  String name3;
  String name4;
  String name5;
  String name6;
  String name7;
  String name8;

  SirenDetails(
      {this.name,
        this.audio,
        this.image,
        this.audio1,
        this.audio2,
        this.audio3,
        this.audio4,
        this.audio5,
        this.audio6,
        this.audio7,
        this.audio8,
        this.name1,
        this.name2,
        this.name3,
        this.name4,
        this.name5,
        this.name6,
        this.name7,
        this.name8});

  SirenDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    audio = json['audio'];
    image = json['image'];
    audio1 = json['audio1'];
    audio2 = json['audio2'];
    audio3 = json['audio3'];
    audio4 = json['audio4'];
    audio5 = json['audio5'];
    audio6 = json['audio6'];
    audio7 = json['audio7'];
    audio8 = json['audio8'];
    name1 = json['name1'];
    name2 = json['name2'];
    name3 = json['name3'];
    name4 = json['name4'];
    name5 = json['name5'];
    name6 = json['name6'];
    name7 = json['name7'];
    name8 = json['name8'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['audio'] = this.audio;
    data['image'] = this.image;
    data['audio1'] = this.audio1;
    data['audio2'] = this.audio2;
    data['audio3'] = this.audio3;
    data['audio4'] = this.audio4;
    data['audio5'] = this.audio5;
    data['audio6'] = this.audio6;
    data['audio7'] = this.audio7;
    data['audio8'] = this.audio8;
    data['name1'] = this.name1;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['name4'] = this.name4;
    data['name5'] = this.name5;
    data['name6'] = this.name6;
    data['name7'] = this.name7;
    data['name8'] = this.name8;
    return data;
  }
}