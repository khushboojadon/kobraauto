import 'package:kobraauto/api_provider/fan_api_provider.dart';
import 'package:kobraauto/models/fans_model.dart';


class FanRepository{
  final FanApiProvider fanApiProvider = FanApiProvider();
  Future<List<FanDetails>> loginCall() =>
      fanApiProvider.getList();
}