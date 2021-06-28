import 'package:flutter/material.dart';
import 'package:kobraauto/screens/aboutus.dart';
import 'package:kobraauto/screens/contact_us.dart';
import 'package:kobraauto/screens/main_screen.dart';
import 'package:kobraauto/screens/splashscreen.dart';
import 'package:kobraauto/themes/apptheme.dart';


class OnlineShop extends StatefulWidget {
  OnlineShop({Key key}) : super(key: key);

  @override
  _OnlineShopState createState() {
    return _OnlineShopState();
  }
}

class _OnlineShopState extends State<OnlineShop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'KobraAuto',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appThemeData,
//        home: ContactUs(),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/main_screen': (BuildContext context) => new MainScreen(),
          './about_us' :(BuildContext context) => new AboutUs(),
          '/contact_us': (BuildContext context) => new ContactUs(),

        },

      ),
    );
  }
}

double getPercentage(BuildContext context, double percentage) {
  return ((MediaQuery.of(context).size.width * percentage) / 100);
  // aspectWidth * 100 / totalWidth
}