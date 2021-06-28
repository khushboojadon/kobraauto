import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kobraauto/models/contactus_model.dart';

ContactUsModel _contactUsModel =
    ContactUsModel(id: 1, Email: "", Phone1: "", Phone2: "", updatedAt: "");

class ContactApiProvider {
  http.Client client = new http.Client();
  Future<ContactUsModel> getContact() async {
    IOClient ioClient = new IOClient();
    Response response;
    try {
      response = await ioClient.post(
        'https://kobra.arasko.in/api/contactus',
        //'https://aim-infosys.com/horn/api/contactus',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
    } on Exception catch (e) {
      print('hello exception ${e}');
      return _contactUsModel;
    }
    if (response.statusCode == 200) {
      ContactUsModel contactUsModel;
      contactUsModel = ContactUsModel.fromJson(jsonDecode(response.body));
      return contactUsModel;
    }
    print('Oyy response ayo ${response.body.toString()}');
    return _contactUsModel;
  }
}
