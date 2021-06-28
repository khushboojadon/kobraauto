import 'package:kobraauto/api_provider/air_horn_api_provider.dart';
import 'package:kobraauto/models/airhorn_model.dart';

class AirHornRepository{
  final AirHornApiProvider airHornApiProvider = AirHornApiProvider();
  Future<List<AirHornDetails>> loginCall() =>
      airHornApiProvider.getList();
}