import 'package:flutter/material.dart';
import 'package:inversecq/about.dart';
import 'package:inversecq/app.dart';
import 'package:inversecq/settings.dart';
import 'package:inversecq/splash.dart';
import 'package:inversecq/welcome.dart';

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
        title: 'Inverse CQ',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: ScreenSplash(),
        routes: <String, WidgetBuilder>{
          "/app": (context) => const ScreenApp(),
          "/settings": (context) => ScreenSettings(),
          "/welcome": (context) => ScreenWelcome(),
          "/about": (context) => ScreenAbout(),
        });
  }
}
