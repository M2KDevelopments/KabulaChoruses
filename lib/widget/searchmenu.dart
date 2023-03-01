import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabulachoruses/controller/ControllerChorus.dart';

class WidgetSearchMenu extends SearchDelegate {
  final List<String> names;
  final _chorusController = Get.find<ControllerChorus>();
  WidgetSearchMenu(this.names);

  void _onSong(BuildContext context, String name) async {
    var index = names.indexOf(name);
    var chorus = await _chorusController.getChorus(index);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "/chorus", arguments: chorus);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = "", icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in names) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
        onTap: () => _onSong(context, matchQuery[index]),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in names) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
        onTap: () => _onSong(context, matchQuery[index]),
      ),
    );
  }
}
