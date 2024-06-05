import 'package:flutter/material.dart';
import 'package:flutter_basics/assets/image_assets/image_asset.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClipRRect"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SizedBox(
            height: 250,
            width: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                ImageAsset.wallpaper,
                fit: BoxFit.fill,
              ),
            )
        ),
      ),
    );
  }
}
