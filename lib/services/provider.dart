import 'package:get_it/get_it.dart';
import 'package:kobraauto/services/about_service.dart';
import 'package:kobraauto/services/contact_service.dart';
import 'package:kobraauto/services/fan_service.dart';
import 'package:kobraauto/services/siren_service.dart';

import 'air_horn_service.dart';
import 'horn_service.dart';

final locator = GetIt.instance;
void setupServiceLocator() {
  locator.registerSingleton(HornDataService());
  locator.registerSingleton(AirHornDataService());
  locator.registerSingleton(FanDataService());
  locator.registerSingleton(SirenDataService());
  locator.registerSingleton(AboutService());
  locator.registerSingleton(ContactService());
}