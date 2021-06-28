import 'package:flutter/material.dart';
import 'package:kobraauto/screens/tabs/air_horn.dart';
import 'package:kobraauto/screens/tabs/fans.dart';
import 'package:kobraauto/screens/tabs/horns.dart';
import 'package:kobraauto/screens/tabs/sirens.dart';

class HomeScreen extends StatefulWidget {
//  final Function openMenu;
  final TabController tabController;
  HomeScreen({Key key,this.tabController}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: new TabBarView(
        children: <Widget>[
          Horns(),
          AirHorns(),
          Fans(),
          Sirens(),
        ],
        controller: widget.tabController,
      ),
    );
  }
}