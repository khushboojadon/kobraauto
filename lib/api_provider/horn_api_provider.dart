import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kobraauto/models/horn_model.dart';

List<HornDetails> _list = [];

class HornApiProvider {
  http.Client client = new http.Client();
  Future<List<HornDetails>> getList() async {
    IOClient ioClient = new IOClient();
    Response response;
    try {
      response = await ioClient.post(
        'https://kobra.arasko.in/api/horn',
        //'https://aim-infosys.com/horn/api/horn',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
    } on Exception catch (e) {
      print('hello exception ${e}');
      return _list;
    }
    Iterable l = json.decode(response.body);
    l.forEach((element) {
      HornDetails data = HornDetails.fromJson(element);
      print('oyy data ${data.toJson()}');
      _list.add(data);
    });
    print('a pa6u apvanu list che ${_list[0].toJson()}');

    print('Oyy response ayo ${l}');
    print('Oyy response ayo ${response.body.toString()}');

    return _list;
  }
}
