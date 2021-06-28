import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobraauto/services/contact_service.dart';
import 'package:kobraauto/services/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() {
    return _ContactUsState();
  }
}

class _ContactUsState extends State<ContactUs> {
  final _appData = locator<ContactService>();
  ContactService contactService;
  @override
  void initState() {
    super.initState();
    contactService = ContactService();
    contactService.getListCall();
    contactService.$contactData
      ..listen((value) {
        if (value.Email != "") {
          contactList.add(Contact(icon: 'Email', contact: '${value.Email}'));
        }
        if (value.Phone1 != "") {
          contactList.add(Contact(icon: 'Contact', contact: '${value.Phone1}'));
        }
        if (value.Phone2 != "") {
          contactList.add(Contact(icon: 'Contact', contact: '${value.Phone2}'));
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Contact> contactList = [];
  List<String> followOn = [
    'call',
    'whatsapp',
    'massage',
    'gmail',
    'browser',
  ];
  void openUrl(String name) async {
    switch (name) {
      case 'call':
        {
          launch("tel:${contactList[1].contact}");
        }
        break;
        // case 'whatsapp':{
        //   await FlutterLaunch.launchWathsApp(phone: "+91 ${contactList[1].contact}", message: "");
        // }
        break;
      case 'massage':
        {
          launch("sms:${contactList[1].contact}");
        }
        break;
      case 'gmail':
        {
          launch("mailto:${contactList[0].contact}");
        }
        break;
      case 'browser':
        {
          await launch("http://www.kobrahorns.com/");
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: contactList.length > 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            color: Colors.white,
//                    border: Border.all(color: Colors.black,width: 0.4),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
//                        spreadRadius: 0.2,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 12.0),
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(
                                    contactList.length,
                                    (index) => Row(
                                      children: [
                                        Text('${contactList[index].icon}: '),
                                        SizedBox(
                                          height: 24.0,
                                        ),
                                        Text(
                                          ' ${contactList[index].contact}',
                                          style: TextStyle(
                                              color: index == 0
                                                  ? Colors.black
                                                  : Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 2.0,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                followOn.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    openUrl('${followOn[index]}');
                                  },
                                  child: Container(
                                    width: getPercentage(context, 14.4),
                                    height: getPercentage(context, 14.4),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/${followOn[index]}.png')),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          offset: Offset(0, 0),
                                          blurRadius: 3.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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

class Contact {
  final String icon;
  final String contact;

  Contact({this.icon, this.contact});
}
