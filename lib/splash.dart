import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  void _onStart() {
    Navigator.pushNamed(context, "/app");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              ElevatedButton(
                  onPressed: _onStart, child: const Text('Inverse Bible Study'))
            ],
          ),
        ),
      )),
    );
  }
}
