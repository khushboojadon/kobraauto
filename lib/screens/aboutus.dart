import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobraauto/services/about_service.dart';
import 'package:kobraauto/services/provider.dart';
import 'package:kobraauto/themes/apptheme.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);
  @override
  _AboutUsState createState() {
    return _AboutUsState();
  }
}

class _AboutUsState extends State<AboutUs> {
  final _appData = locator<AboutService>();
  AboutService aboutService;
  String text1 = '';
  String text2 = '';
  @override
  void initState() {
    super.initState();
    aboutService = AboutService();
    aboutService.getListCall();
    aboutService.$aboutData
      ..listen((value) {
        if (value.p1 != "") {
          text1 = value.p1;
        }
        if (value.p2 != "") {
          text2 = value.p2;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    aboutService.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: text1 != ""
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10.0),
                          child: Text(
                            'ABOUT US',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff4D4E59),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          '$text1',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppTheme.regularTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '$text2',
//                    'Our goal is to manufacture range that is best in quality. We leave no stone unturned in delivering products that are checked and supervised by the quality auditors. For ensuring the quality of the range, we are also possessed with special quality testing laboratory comprising of requisite machineries, technologies for confirming the quality of the products.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              color: AppTheme.regularTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 12.0,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
