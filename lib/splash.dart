import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final _size = 180.0;

  void _onStart() => Navigator.pushNamed(context, "/app");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: _size,
                height: _size,
              ),
              ElevatedButton(
                onPressed: _onStart,
                child: const Text('Kabula Choruses'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
