import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/action_listener/gesture_detector/horizontal_drag.dart';

void main() {
  runApp(const MaterialApp(
    home: SplashScreenGame(),
  ));
}

class SplashScreenGame extends StatefulWidget {
  const SplashScreenGame({super.key});

  @override
  State<SplashScreenGame> createState() => SplashScreenGameState();
}

class SplashScreenGameState extends State<SplashScreenGame> {
  FlameSplashController? controller;

  @override
  void initState() {
    super.initState();
    controller = FlameSplashController(
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
      autoStart: true,
    );
  }

  @override
  void dispose() {
    controller?.dispose(); // dispose it when necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showBefore: (BuildContext context) {
          return const Text("Before the logo");
        },
        showAfter: (BuildContext context) {
          return const Text("After the logo");
        },
        theme: FlameSplashTheme.white,
        onFinish: (context) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Home())
        ),
        controller: controller,
      ),
    );
  }
}
