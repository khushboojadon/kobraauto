import 'package:kobraauto/api_provider/about_apiprovider.dart';
import 'package:kobraauto/models/aboutus_model.dart';

class AboutUsRepository {
  final AboutApiProvider aboutApiProvider = AboutApiProvider();

  Future<AboutUsModel> getAbout() =>
      aboutApiProvider.getAbout();
}