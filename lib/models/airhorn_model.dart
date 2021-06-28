class AirHornDetails {
  String name;
  String voltage;
  String application;
  String image;
  String audio;

  AirHornDetails(
      {this.name, this.voltage, this.application, this.image, this.audio});

  AirHornDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    voltage = json['voltage'];
    application = json['application'];
    image = json['image'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['voltage'] = this.voltage;
    data['application'] = this.application;
    data['image'] = this.image;
    data['audio'] = this.audio;
    return data;
  }
}