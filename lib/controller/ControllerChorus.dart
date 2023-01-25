// ignore: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kabulachoruses/classes/chorus.dart';

class ControllerChorus extends GetxController {
  final names = <String>[].obs;

  Future load() async {
    var file = await rootBundle.loadString("assets/chorus.json");
    var list = List.of(jsonDecode(file)).cast<String>();
    if (kDebugMode) print("${list.length} Songs");
    names.value = list;
  }

  String getName(int index) {
    return names[index];
  }

  Future<String> getYoutube(int index) async {
    var name = names[index];
    var file = await rootBundle.loadString("assets/content/$name.json");
    var song = jsonDecode(file);
    return song["youtube"] ?? "";
  }

  Future<Chorus> getChorus(int index) async {
    var name = names[index];
    var file = await rootBundle.loadString("assets/content/$name.json");
    var song = jsonDecode(file);
    if (kDebugMode) print(name);
    var verses = List<String>.empty();
    var verse = List<String>.empty();
    var chorus = "";
    var youtube = "";
    if (song["chorus"] != null) chorus = song["chorus"].toString();
    if (song["verses"] != null) verses = List.of(song["verses"]).cast<String>();
    if (song["verse"] != null) verse = List.of(song["verse"]).cast<String>();
    if (song["youtube"] != null) youtube = song["youtube"].toString();
    return Chorus(name, verses, verse, chorus, youtube);
  }
}
