import 'package:flutter/material.dart';
import 'package:kabulachoruses/about.dart';
import 'package:kabulachoruses/app.dart';
import 'package:kabulachoruses/splash.dart';

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
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const ScreenSplash(),
        routes: <String, WidgetBuilder>{
          "/app": (context) => const ScreenApp(),
          "/about": (context) => ScreenAbout(),
        });
  }
}
