class ContactUsModel {
  int id;
  String Email;
  String Phone1;
  String Phone2;
  String updatedAt;

  ContactUsModel(
      {this.id, this.Email, this.Phone1, this.Phone2, this.updatedAt});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Email = json['Email'];
    Phone1 = json['Phone1'];
    Phone2 = json['Phone2'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Email'] = this.Email;
    data['Phone1'] = this.Phone1;
    data['Phone2'] = this.Phone2;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}