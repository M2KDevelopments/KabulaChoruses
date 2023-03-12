import 'package:kabulachoruses/classes/info.dart';

class Chorus {
  final String title;
  late List<String>? verse = [];
  late List<String>? verses = [];
  late String? chorus = "";
  late String? youtube = "";
  late int? number = 0;
  Chorus(this.title,
      {this.verses, this.verse, this.chorus, this.youtube, this.number});

  List<Info> getSong() {
    if (verse!.isNotEmpty) {
      return [Info(title: title, listOfText: verse)];
    } else if (verses!.isNotEmpty) {
      var count = 0;
      List<Info> list = [];
      for (var v in verses!) {
        List<String> lines = [];
        for (var line in v.split("\n")) {
          lines.add(line);
        }
        list.add(Info(title: "Verse ${count + 1}", listOfText: lines));
        //Add Chorus
        if (chorus != "") {
          List<String> lines = [];
          for (var line in chorus!.split("\n")) {
            lines.add(line);
          }
          list.add(Info(title: "Chorus", listOfText: lines));
        }
        count++;
      }
      return list;
    } else {
      return [];
    }
  }
}
