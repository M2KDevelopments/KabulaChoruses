import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kabulachoruses/classes/chorus.dart';

class ScreenChorus extends StatefulWidget {
  const ScreenChorus({Key? key}) : super(key: key);
  @override
  State<ScreenChorus> createState() => _ScreenChorusState();
}

class _ScreenChorusState extends State<ScreenChorus> {
  //Parse text
  String _parseText(String text) =>
      "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}"
          .replaceAll("god", "God")
          .replaceAll("lord", "Lord")
          .replaceAll("jesus", "Jesus");

  void _onYoutube(Chorus chorus) {
    var youtube = chorus.youtube;
    if (kDebugMode) print(youtube);

    if (youtube == null || youtube == "") {
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
        enableEnterKey: true,
      ).show();
    } else {
      Navigator.pushNamed(context, "/youtube", arguments: chorus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final chorus = ModalRoute.of(context)!.settings.arguments as Chorus;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${chorus.number}. ${chorus.title}",
        ),
        actions: [
          IconButton(
              onPressed: () => _onYoutube(chorus),
              icon: const Icon(Icons.play_circle_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: chorus.getSong().length,
            itemBuilder: (context, index) {
              var info = chorus.getSong()[index];
              return Column(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: info.listOfText!
                        .map((text) => Text(
                              _parseText("$text\n"),
                              style: const TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ))
                        .toList())
              ]);
            }),
      ),
    );
  }
}
