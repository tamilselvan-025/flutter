import 'package:flutter/material.dart';
import 'package:flutter_basics/action_listener/gesture_detector/horizontal_drag.dart';

void main() {
  runApp(const MaterialApp(home: SplashScreen(),));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _launchHome();
  }

  Future<void> _launchHome() async {
    return Future.delayed(const Duration(seconds: 1), () =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }


}
