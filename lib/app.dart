import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ScreenApp extends StatefulWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  final _choruses = List<String>.empty();

  @override
  void initState() {
    super.initState();
    _loadingSongs();
  }

  void _loadingSongs() async {
    var file = await rootBundle.loadString("assets/chorus.json");
    var list = jsonDecode(file) as List<dynamic>;
    setState(() {
      if (kDebugMode) print("${list.length} Songs");
      list.forEach((element) => _choruses.add(element.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
