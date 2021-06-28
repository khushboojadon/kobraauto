
import 'package:kobraauto/api_provider/siren_api_provider.dart';
import 'package:kobraauto/models/sirens_model.dart';


class SirenRepository{
  final SirenApiProvider sirenApiProvider = SirenApiProvider();
  Future<List<SirenDetails>> loginCall() =>
      sirenApiProvider.getList();
}