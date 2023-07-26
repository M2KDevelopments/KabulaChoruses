import 'package:flutter/material.dart';
import 'package:kabulachoruses/classes/chorus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScreenYoutube extends StatefulWidget {
  
  const ScreenYoutube({Key? key}) : super(key: key);

  @override
  State<ScreenYoutube> createState() => _ScreenYoutubeState();
}

class _ScreenYoutubeState extends State<ScreenYoutube> {
  @override
  Widget build(BuildContext context) {

    final chorus = ModalRoute.of(context)!.settings.arguments as Chorus;

    return Scaffold(
      appBar: AppBar(
        title: Text(chorus.title),
      ),
      body: Container(
          child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(chorus.youtube!) ?? "",
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            controlsVisibleAtStart: true,
          ),
        ),
        showVideoProgressIndicator: true,
      )),
    );
  }
}
