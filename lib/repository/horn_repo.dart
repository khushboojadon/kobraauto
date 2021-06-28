import 'package:kobraauto/api_provider/horn_api_provider.dart';
import 'package:kobraauto/models/horn_model.dart';

class HornRepository{
  final HornApiProvider hornApiProvider = HornApiProvider();
  Future<List<HornDetails>> loginCall() =>
      hornApiProvider.getList();
 }