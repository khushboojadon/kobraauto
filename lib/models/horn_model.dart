class HornDetails {
  String name;
  String diameter;
  String voltage;
  String current;
  String application;
  String audio;
  String image;
  String sound;

  HornDetails(
      {
        this.name,
        this.diameter,
        this.voltage,
        this.current,
        this.application,
        this.audio,
        this.image,this.sound});

  HornDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    diameter = json['diameter'];
    voltage = json['voltage'];
    current = json['current'];
    application = json['application'];
    audio = json['audio'];
    image = json['image'];
    sound = json['sound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['diameter'] = this.diameter;
    data['voltage'] = this.voltage;
    data['current'] = this.current;
    data['application'] = this.application;
    data['audio'] = this.audio;
    data['image'] = this.image;
    data['sound'] = this.sound;
    return data;
  }
}
