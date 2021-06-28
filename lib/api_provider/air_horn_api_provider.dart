import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kobraauto/models/airhorn_model.dart';

List<AirHornDetails> _list = [];

class AirHornApiProvider {
  http.Client client = new http.Client();
  Future<List<AirHornDetails>> getList() async {
    IOClient ioClient = new IOClient();
    Response response;
    try {
      response = await ioClient.post(
        'https://kobra.arasko.in/api/airhorn',
        //'https://aim-infosys.com/horn/api/airhorn',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
    } on Exception catch (e) {
      print('hello exception ${e}');
      return _list;
    }
    Iterable l = json.decode(response.body);
    l.forEach((element) {
      AirHornDetails data = AirHornDetails.fromJson(element);
      print('oyy data ${data.toJson()}');
      _list.add(data);
    });
    print('a pa6u apvanu list che ${_list[0].toJson()}');

    print('Oyy response ayo ${l}');
    print('Oyy response ayo ${response.body.toString()}');

    return _list;
  }
}
