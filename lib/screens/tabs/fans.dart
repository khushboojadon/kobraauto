import 'package:flutter/material.dart';
import 'package:kobraauto/models/fans_model.dart';
import 'package:kobraauto/services/fan_service.dart';
import 'package:kobraauto/services/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class Fans extends StatefulWidget {
  Fans({Key key}) : super(key: key);

  @override
  _FansState createState() {
    return _FansState();
  }
}

List<FanDetails> _list = [];

class _FansState extends State<Fans> {
  int selectedIndex = 0;
  final _appData = locator<FanDataService>();
  FanDataService fanDataService;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    fanDataService = FanDataService();
    audioPlayer = AudioPlayer();
    if (_list.length == 0) {
      fanDataService.getListCall();
    }
    fanDataService.$fanListData
      ..listen((value) {
        if (value.length > 0) {
          _list = value;
          print('oyy init $_list');
          setState(() {});
        }
      });
  }

//  play() async {
//    int result = await audioPlayer.play('http://hrminfosec.site/public/audio/${}');
//    if (result == 1) {
//      // success
//    }
//  }
  @override
  void dispose() {
    super.dispose();
    fanDataService.dispose();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _list.length > 0 ? Colors.grey.withOpacity(0.5) : Colors.white,
      child: _list.length > 0
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 4.0, 2.0, 0.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: EdgeInsets.only(bottom: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          children: List.generate(
                              _list.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      changeIndex(index);
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: index == selectedIndex ? 8 : 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.network(
                                            'https://kobra.arasko.in/public/images/${_list[index].image}',
                                            // 'https://aim-infosys.com/horn/public/images/${_list[index].image}',
                                            height: 70,
//                                  width: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            '${_list[index].name}',
                                            style:
                                                TextStyle(color: Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 40.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'VOLTAGE - ${_list[selectedIndex].voltage}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10.0)),
                                Text(
                                  'APPLICATION - ${_list[selectedIndex].application}',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Text('${_list[selectedIndex].name}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: Text(
                'No records found',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
