import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kobraauto/models/fans_model.dart';

List<FanDetails> _list = [];

class FanApiProvider {
  http.Client client = new http.Client();
  Future<List<FanDetails>> getList() async {
    IOClient ioClient = new IOClient();
    Response response;
    try {
      response = await ioClient.post(
        'https://kobra.arasko.in/api/fans',
        //'https://aim-infosys.com/horn/api/fans',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
    } on Exception catch (e) {
      print('hello exception ${e}');
      return _list;
    }
    Iterable l = json.decode(response.body);
    l.forEach((element) {
      FanDetails data = FanDetails.fromJson(element);
      print('oyy data ${data.toJson()}');
      _list.add(data);
    });
    print('a pa6u apvanu list che ${_list[0].toJson()}');

    print('Oyy response ayo ${l}');
    print('Oyy response ayo ${response.body.toString()}');

    return _list;
  }
}
