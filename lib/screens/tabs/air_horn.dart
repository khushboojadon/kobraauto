import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobraauto/models/airhorn_model.dart';
import 'package:kobraauto/services/air_horn_service.dart';
import 'package:kobraauto/services/provider.dart';

class AirHorns extends StatefulWidget {
  AirHorns({Key key}) : super(key: key);

  @override
  _AirHornsState createState() {
    return _AirHornsState();
  }
}

List<AirHornDetails> _list = [];

class _AirHornsState extends State<AirHorns> {
  int selectedIndex = 0;
  bool isPlaying = false;
  final _appData = locator<AirHornDataService>();
  AirHornDataService airHornDataService;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    airHornDataService = AirHornDataService();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (s == AudioPlayerState.PLAYING) {
        isPlaying = true;
      } else {
        isPlaying = false;
      }
      setState(() {});
    }, onError: (_msg) {
      isPlaying = false;
      setState(() {});
    });
    if (_list.length == 0) {
      airHornDataService.getListCall();
    }
    airHornDataService.$airHornListData
      ..listen((value) {
        if (value.length > 0) {
          _list = value;
          print('oyy init $_list');
          setState(() {});
        }
      });
  }

  play(url) async {
    audioPlayer.stop();
    int result =
        await audioPlayer.play('https://kobra.arasko.in/public/audio/$url');
    //'https://aim-infosys.com/horn/public/audio/$url');
    print('hello esult $result');
  }

  @override
  void dispose() {
    super.dispose();
    airHornDataService.dispose();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 80;
    final double itemWidth = size.width * 0.15;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _list.length > 0 ? Colors.grey.withOpacity(0.5) : Colors.white,
      child: _list.length > 0
          ? Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4.0, 4.0, 2.0, 0.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: EdgeInsets.only(bottom: 20.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: GridView.count(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              childAspectRatio: (itemWidth / itemHeight),
                              children: List.generate(
                                  _list.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          changeIndex(index);
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation:
                                              index == selectedIndex ? 10 : 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.network(
                                                'https://kobra.arasko.in/public/images/thumb-${_list[index].image}',
                                                //   'https://aim-infosys.com/horn/public/images/thumb-${_list[index].image}',
                                                height: 70,
                                                width: double.infinity,
                                                fit: BoxFit.fitHeight,
                                              ),
                                              Text(
                                                '${_list[index].name}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0),
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
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'DESCRIPTION - ${_list[selectedIndex].name}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10.0)),
                                  Text(
                                      'VOLTAGE - ${_list[selectedIndex].voltage}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10.0)),
                                  Text(
                                      'APPLICATION - ${_list[selectedIndex].application}',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10.0)),
                                ],
                              ),
                              Text('${_list[selectedIndex].name}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline))
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  print(
                                      'ontap called ${_list[selectedIndex].audio}');
                                  play(_list[selectedIndex].audio);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  height: 40,
                                  child: isPlaying
                                      ? Icon(
                                          Icons.pause,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                isPlaying
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.4),
                        child: Center(
                          child: CupertinoActivityIndicator(
                            animating: true,
                            radius: 12.0,
                          ),
                        ),
                      )
                    : SizedBox(),
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
