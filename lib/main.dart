import 'package:flutter/material.dart';
import 'package:kabulachoruses/screens/about.dart';
import 'package:kabulachoruses/screens/app.dart';
import 'package:kabulachoruses/screens/chorus.dart';
import 'package:kabulachoruses/screens/splash.dart';
import 'package:kabulachoruses/screens/youtube.dart';

void main() {
  //shared preferences settings
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kabula Choruses',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const ScreenSplash(),
        routes: <String, WidgetBuilder>{
          "/app": (context) => const ScreenApp(),
          "/chorus": (context) => const ScreenChorus(),
          "/youtube": (context) => const ScreenYoutube(),
          "/about": (context) => const ScreenAbout(),
        });
  }
}
