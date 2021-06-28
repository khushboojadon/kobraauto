import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kobraauto/services/provider.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   setupServiceLocator();
  orientations();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xff111317),
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(OnlineShop());
}

void orientations() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

double getWidth(BuildContext context, double percentage) {
  return ((MediaQuery.of(context).size.width * percentage) / 100);
}

double getHeight(BuildContext context, double percentage) {
  return ((MediaQuery.of(context).size.height * percentage) / 100);
}