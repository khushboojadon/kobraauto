import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kobraauto/models/aboutus_model.dart';

AboutUsModel _aboutUsModel = AboutUsModel(id: 1, p1: "", p2: "", updatedAt: "");

class AboutApiProvider {
  http.Client client = new http.Client();
  Future<AboutUsModel> getAbout() async {
    IOClient ioClient = new IOClient();
    Response response;
    try {
      response = await ioClient.post(
        'https://kobra.arasko.in/api/aboutus',
        // 'https://aim-infosys.com/horn/api/aboutus',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
    } on Exception catch (e) {
      print('hello exception ${e}');
      return _aboutUsModel;
    }
    if (response.statusCode == 200) {
      AboutUsModel aboutUsModel;
      aboutUsModel = AboutUsModel.fromJson(jsonDecode(response.body));
      print('hello aboutus object ${aboutUsModel.p1}');
      print('hello aboutus object ${aboutUsModel.p2}');
      return aboutUsModel;
    }

    print('Oyy response ayo ${response.body.toString()}');

    return _aboutUsModel;
  }
}
