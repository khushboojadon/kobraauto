import 'package:flutter/material.dart';
import 'package:kobraauto/screens/aboutus.dart';
import 'package:kobraauto/screens/contact_us.dart';
import 'package:kobraauto/screens/tabs/air_horn.dart';
import 'package:kobraauto/screens/tabs/fans.dart';
import 'package:kobraauto/screens/tabs/horns.dart';
import 'package:kobraauto/screens/tabs/sirens.dart';

import 'homescreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  String currentScreen = 'Home';
  Widget body = Container();
  int currentTab = 0;
  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      if (currentTab != _tabController.index) {
        currentTab = _tabController.index;
        print('--------------$currentTab');
        setState(() {});
      }
    });
    changeBodyView(0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  void changeBodyView(int index) {
    switch (index) {
      case 0:
        {
          body = HomeScreen(
            tabController: _tabController,
//            openMenu: () => {_startAnimation()},
          );
          currentScreen = 'Home';
          break;
        }
      case 1:
        {
          body = AboutUs();
          currentScreen = 'About';
          break;
        }
      case 2:
        {
          body = ContactUs();
          currentScreen = 'Contact';
          break;
        }
    }
    setState(() {
//      currentTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text('Home',style: TextStyle(color: Colors.black),),
                      leading: Icon(Icons.home,color: Colors.black),
                      onTap: (){
                        Navigator.pop(context);
                        changeBodyView(0);
                      },
                    ),
                    SizedBox(width: double.infinity,height: 0.5,child: Container(color: Colors.grey,),),
                    ListTile(
                      title: Text('About Us',style: TextStyle(color: Colors.black),),
                      leading: Icon(Icons.info,color: Colors.black,),
                      onTap: (){
                        Navigator.pop(context);
                        changeBodyView(1);
//                        Navigator.pushReplacement(
//                          context,
//                          MaterialPageRoute(builder: (context) => AboutUs()),
//                        );

                      },
                    ),
                    SizedBox(width: double.infinity,height: 0.5,child: Container(color: Colors.grey,),),
                    ListTile(
                      title: Text('Contact Us',style: TextStyle(color: Colors.black),),
                      leading: Icon(Icons.call,color: Colors.black,),
                      onTap: (){
                        Navigator.pop(context);
                        changeBodyView(2);
//                        Navigator.pushReplacement(
//                          context,
//                          MaterialPageRoute(builder: (context) => ContactUs()),
//                        );
                      },
                    ),
                    SizedBox(width: double.infinity,height: 0.5,child: Container(color: Colors.grey,),),
                  ],
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    image:DecorationImage(
                      image: AssetImage('assets/images/kobra.png'),
                    ),
                  ),
                )

              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.yellowAccent,
            title: Image.asset('assets/images/kobra.png',
              height: 28,
              fit: BoxFit.fitHeight,
            ),
            centerTitle: true,
            bottom:  currentScreen == 'Home'?TabBar(
              labelPadding: EdgeInsets.only(left: 5, right: 5),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Color(0xff6A6A6A),
              indicatorColor: Color(0xff6A6A6A),
              tabs: <Tab>[
                new Tab(
                  text: "HORNS",
                ),
                new Tab(
                  text: "AIR HORN",
                ),
                new Tab(
                  text: "FANS",
                ),
                new Tab(
                  text: "SIRENS",
                ),
              ],
              controller: _tabController,
            ):null,
          ),

          body:body,
        ),
      ),
    );
  }
}