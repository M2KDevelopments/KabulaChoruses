import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabulachoruses/controller/ControllerChorus.dart';
import 'package:lottie/lottie.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final _size = 200.0;
  final _controllerChorus = Get.put(ControllerChorus());

  @override
  void initState() {
    super.initState();
    _controllerChorus
        .load()
        .then((value) => Navigator.popAndPushNamed(context, "/app"));
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
              Image.asset(
                'assets/logo.png',
                width: _size,
                height: _size,
              ),
              SizedBox(
                width: _size,
                height: _size,
                child: Lottie.asset('assets/anim/loading.json'),
              ),
              const Text(
                "Loading...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
