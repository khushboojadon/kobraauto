import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobraauto/models/horn_model.dart';
import 'package:kobraauto/services/horn_service.dart';
import 'package:kobraauto/services/provider.dart';

class Horns extends StatefulWidget {
  Horns({Key key}) : super(key: key);

  @override
  _HornsState createState() {
    return _HornsState();
  }
}

List<HornDetails> _list = [];

class _HornsState extends State<Horns> {
  int selectedIndex = 0;
  bool isPlaying = false;
  bool isPlaying1 = false;
  final _appData = locator<HornDataService>();
  HornDataService hornDataService;
  AudioPlayer audioPlayer, audioPlayer1;
  @override
  void initState() {
    super.initState();
    hornDataService = HornDataService();
    audioPlayer = AudioPlayer();
    audioPlayer1 = AudioPlayer();
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
    audioPlayer1.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (s == AudioPlayerState.PLAYING) {
        isPlaying1 = true;
      } else {
        isPlaying1 = false;
      }
      setState(() {});
    }, onError: (_msg) {
      isPlaying = false;
      setState(() {});
    });

    if (_list.length == 0) {
      hornDataService.getListCall();
    }
    hornDataService.$hornListData
      ..listen((value) {
        if (value.length > 0) {
          _list = value;
          print('oyy init $_list');
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    hornDataService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 80;
    final double itemWidth = size.width * 0.15;
    // TODO: implement build
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
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Card(
                                            color: Colors.white,
                                            elevation:
                                                index == selectedIndex ? 10 : 0,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Image.network(
                                                    'https://kobra.arasko.in/public/images/thumb-${_list[index].image}',
                                                    //  'https://aim-infosys.com/horn/public/images/thumb-${_list[index].image}',
                                                    height: 70,
                                                    fit: BoxFit.fitHeight,
                                                    width: double.infinity,
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      '${_list[index].name}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
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
                                      'DIAMETER - ${_list[selectedIndex].diameter}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10.0)),
                                  Text(
                                      'VOLTAGE - ${_list[selectedIndex].voltage}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10.0)),
                                  Text(
                                      'CURRENT - ${_list[selectedIndex].current}',
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
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          'ontap called ${_list[selectedIndex].audio}');
                                      play(_list[selectedIndex].sound, 'high');
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.volume_up,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          'ontap called ${_list[selectedIndex].audio}');
                                      play(_list[selectedIndex].audio, 'low');
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.volume_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                          'ontap called ${_list[selectedIndex].audio}');
                                      playBoth(_list[selectedIndex].audio,
                                          _list[selectedIndex].sound);
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.volume_up,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Icon(
                                            Icons.volume_up,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                isPlaying || isPlaying1
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

  play(String url, String sound) async {
    audioPlayer.stop();
    if (sound == 'low') {
      print('are sound ma low che ${audioPlayer}');
      audioPlayer.setVolume(0.1);
    } else if (sound == 'high') {
      audioPlayer.setVolume(1.0);
    } else {
      audioPlayer.setVolume(0.3);
    }
    print('Hello url https://aim-infosys.com/public/audio/$url');
    int result =
        await audioPlayer.play('https://kobra.arasko.in/public/audio/$url');
    //'https://aim-infosys.com/horn/public/audio/$url');
    print('hello result $result');
  }

  playBoth(String url, String sound) async {
    audioPlayer.stop();

    int result =
        await audioPlayer.play('https://kobra.arasko.in/public/audio/$url');
    //'https://aim-infosys.com/horn/public/audio/$url');
    int result1 =
        await audioPlayer1.play('https://kobra.arasko.in/public/audio/$sound');
    //'https://aim-infosys.com/horn/public/audio/$sound');
    print('hello result $result and result of 2nd one is  $result1');
  }

  void changeIndex(int index) async {
    selectedIndex = index;

    setState(() {});
  }
}
