import 'package:flutter/material.dart';

class ScreenAbout extends StatefulWidget {
  ScreenAbout({Key? key}) : super(key: key);

  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends State<ScreenAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Container(),
    );
  }
}
