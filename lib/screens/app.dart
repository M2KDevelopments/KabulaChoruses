import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabulachoruses/controller/ControllerChorus.dart';

class ScreenApp extends StatefulWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  final _chorusController = Get.find<ControllerChorus>();

  void _onSong(int index) async {
    var chorus = await _chorusController.getChorus(index);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "/chorus", arguments: chorus);
  }

  void _onYoutube(int index) async {
    var youtube = await _chorusController.getYoutube(index);
    if (kDebugMode) print(youtube);
  }

  void _onChooseSongByNumber() {}

  void _onAbout() {
    Navigator.pushNamed(context, "/about");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choruses"),
        actions: [
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
                            color: Colors.blueGrey,
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
                                      color: Color.fromARGB(255, 49, 82, 94),
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
