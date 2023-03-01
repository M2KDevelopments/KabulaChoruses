import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabulachoruses/controller/ControllerChorus.dart';
import 'package:kabulachoruses/widget/searchmenu.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:new_version/new_version.dart';

class ScreenApp extends StatefulWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  final _chorusController = Get.find<ControllerChorus>();

  @override
  void initState() {
    super.initState();
    // Instantiate NewVersion manager object (Using GCP Console app as example)
    final newVersion = NewVersion(
      //iOSId: 'com.m2kdevelopments.kabulachoruses',
      androidId: 'com.m2kdevelopments.kabulachoruses',
    );
    newVersion.showAlertIfNecessary(context: context);
  }

  void _onSong(int index) async {
    var chorus = await _chorusController.getChorus(index);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "/chorus", arguments: chorus);
  }

  void _onYoutube(int index) async {
    var youtube = await _chorusController.getYoutube(index);
    if (kDebugMode) print(youtube);

    if (youtube == "") {
      AwesomeDialog(
        context: context,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.warning,
        barrierColor: Colors.black12,
        body: const Center(
            child: Text(
          "No Youtube Video Available",
          style: TextStyle(fontSize: 17, color: Colors.purple),
        )),
        btnOkColor: Colors.purple,
        btnOkIcon: Icons.music_note,
        btnOkText: "Go To Chorus",
        btnOkOnPress: () => _onSong(index),
        enableEnterKey: true,
      ).show();
    } else {
      var initialVideoId = youtube.replaceAll(RegExp(r'.*v='), '');

      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        barrierColor: Colors.black12,
        body: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: initialVideoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
        btnOkColor: Colors.purple,
        btnOkIcon: Icons.music_note,
        btnOkText: "Go To Chorus",
        btnOkOnPress: () => _onSong(index),
        enableEnterKey: true,
      ).show();
    }
  }

  Widget _btnNumber(int num) {
    var size = 70.0;
    var btnStyle = ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 96, 13, 107)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2),
          side: const BorderSide(color: Color.fromARGB(255, 50, 13, 53)),
        ),
      ),
    );

    var textStyle = const TextStyle(fontSize: 25);
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
          style: btnStyle,
          onPressed: () => setState(() {
                var songNumber = _chorusController.songNumber.value;
                if ((songNumber * 10) + num > _chorusController.names.length) {
                  songNumber = _chorusController.names.length;
                } else {
                  songNumber *= 10;
                  songNumber += num;
                }
                _chorusController.setNumber(songNumber);
              }),
          child: Text(
            num.toString(),
            style: textStyle,
          )),
    );
  }

  Widget _btnClear() {
    var size = 40.0;
    var btnStyle = ButtonStyle(
      alignment: Alignment.center,
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 31, 131, 238)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2),
          side: const BorderSide(color: Color.fromARGB(255, 21, 85, 154)),
        ),
      ),
    );

    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
          style: btnStyle,
          onPressed: () => setState(() => _chorusController.setNumber(0)),
          icon: const Icon(Icons.delete)),
    );
  }

  void _onChooseSongByNumber() {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.info,
      barrierColor: Colors.black12,
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _chorusController.songNumber.toString(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _btnClear(),
                ],
              ),
              const SizedBox(
                width: 0,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _btnNumber(1),
                  _btnNumber(2),
                  _btnNumber(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _btnNumber(4),
                  _btnNumber(5),
                  _btnNumber(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _btnNumber(7),
                  _btnNumber(8),
                  _btnNumber(9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_btnNumber(0)],
              )
            ],
          ),
        ),
      ),
      btnOkColor: Colors.purple,
      btnOkIcon: Icons.music_note,
      btnOkText: "Go To Chorus",
      btnOkOnPress: () {
        var index = _chorusController.songNumber.value - 1;
        if (_chorusController.songNumber.value > 0) {
          _onSong(index);
        }
      },
      enableEnterKey: true,
    ).show();
  }

  void _onAbout() {
    Navigator.pushNamed(context, "/about");
  }

  void _onSearch(BuildContext context) {
    showSearch(
        context: context, delegate: WidgetSearchMenu(_chorusController.names));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choruses"),
        elevation: 8.0,
        actions: [
          IconButton(
              onPressed: () => _onSearch(context),
              icon: const Icon(Icons.search)),
          IconButton(onPressed: _onAbout, icon: const Icon(Icons.info_outline))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onChooseSongByNumber,
        elevation: 8.0,
        child: const Icon(Icons.numbers),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            child: ListView.builder(
                itemCount: _chorusController.names.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _onSong(index),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.music_note,
                            size: 40,
                            color: Color.fromARGB(255, 79, 11, 108),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              "${index + 1}. ${_chorusController.names[index]}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => _onYoutube(index),
                                    icon: const Icon(
                                      size: 30,
                                      Icons.play_circle_outline,
                                      color: Color.fromARGB(255, 85, 49, 94),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
