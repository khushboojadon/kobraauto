class FanDetails {
  String name;
  String voltage;
  String application;
  String image;

  FanDetails({this.name, this.voltage, this.application, this.image=""});

  FanDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    voltage = json['voltage'];
    application = json['application'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['voltage'] = this.voltage;
    data['application'] = this.application;
    data['image'] = this.image;
    return data;
  }
}