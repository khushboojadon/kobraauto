import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobraauto/models/sirens_model.dart';
import 'package:kobraauto/services/provider.dart';
import 'package:kobraauto/services/siren_service.dart';

class Sirens extends StatefulWidget {
  Sirens({Key key}) : super(key: key);

  @override
  _SirensState createState() {
    return _SirensState();
  }
}

List<SirenDetails> _list = [];

class _SirensState extends State<Sirens> {
  int selectedIndex = 0;
  bool isPlaying = false;
  final _appData = locator<SirenDataService>();
  SirenDataService sirenDataService;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    sirenDataService = SirenDataService();
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
      sirenDataService.getListCall();
    }
    sirenDataService.$sirenListData
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
    print('Hello url https://aim-infosys.com/public/audio/$url');
    int result =
        await audioPlayer.play('https://kobra.arasko.in/public/audio/$url');
    //'https://aim-infosys.com/horn/public/audio/$url');
    print('hello esult $result');
  }

  @override
  void dispose() {
    super.dispose();
    sirenDataService.dispose();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    final double itemHeight = 70;
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
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
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
                                                  //  'https://aim-infosys.com/horn/public/images/thumb-${_list[index].image}',
                                                  height: 70,
                                                  width: double.infinity,
                                                  fit: BoxFit.contain,
                                                ),
                                                Text(
                                                  '${_list[index].name}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 10, left: 12.0, right: 12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _list[selectedIndex].audio1 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio1);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name1}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio2 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio2);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name2}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio3 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio3);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name3}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio4 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio4);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name4}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _list[selectedIndex].audio5 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio5);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name5}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio6 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio6);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name6}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio7 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio6);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name7}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(
                                child: _list[selectedIndex].audio8 != null
                                    ? GestureDetector(
                                        onTap: () {
                                          play(_list[selectedIndex].audio8);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '${_list[selectedIndex].name7}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              )
                            ],
                          ),
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
