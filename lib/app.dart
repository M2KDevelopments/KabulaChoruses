import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kabulachoruses/classes/chorus.dart';

class ScreenApp extends StatefulWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  final _maxText = 18;
  var _choruses = List<String>.empty();

  @override
  void initState() {
    super.initState();
    _loadingSongs();
  }

  void _loadingSongs() async {
    var file = await rootBundle.loadString("assets/chorus.json");
    var list = List.of(jsonDecode(file)).cast<String>();
    if (kDebugMode) print("${list.length} Songs");
    setState(() => _choruses = list);
  }

  void _onSong(int index, BuildContext buildercontext) async {
    var name = _choruses[index];
    var file = await rootBundle.loadString("assets/content/$name.json");
    var song = jsonDecode(file);
    if (kDebugMode) print(name);
    var verses = List<String>.empty();
    var verse = List<String>.empty();
    var chorus = "";
    if (song["chorus"] != null) chorus = song["chorus"].toString();
    if (song["verses"] != null) verses = List.of(song["verses"]).cast<String>();
    if (song["verse"] != null) verse = List.of(song["verse"]).cast<String>();
    var music = Chorus(name, verses, verse, chorus);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(buildercontext, "/chorus", arguments: music);
  }

  void _onYoutube(int index) async {
    var name = _choruses[index];
    var file = await rootBundle.loadString("assets/content/$name.json");
    var song = jsonDecode(file);
    if (kDebugMode) print(song["youtube"]);
  }

  void _onChooseSong() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choruses"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onChooseSong,
        elevation: 8.0,
        child: const Icon(Icons.numbers),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          child: ListView.builder(
              itemCount: _choruses.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _onSong(index, context),
                  child: Card(
                    elevation: 10.0,
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
                            "${index + 1}. ${_choruses[index]}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
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
    );
  }
}
