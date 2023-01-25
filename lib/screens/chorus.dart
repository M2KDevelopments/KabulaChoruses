import 'package:flutter/material.dart';
import 'package:kabulachoruses/classes/chorus.dart';

class ScreenChorus extends StatefulWidget {
  const ScreenChorus({Key? key}) : super(key: key);
  @override
  State<ScreenChorus> createState() => _ScreenChorusState();
}

class _ScreenChorusState extends State<ScreenChorus> {
  void _onYoutube() {}

  @override
  Widget build(BuildContext context) {
    final chorus = ModalRoute.of(context)!.settings.arguments as Chorus;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(chorus.title),
            IconButton(
                onPressed: _onYoutube,
                icon: const Icon(Icons.play_circle_outline))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Text(chorus.title),
          ],
        ),
      ),
    );
  }
}
