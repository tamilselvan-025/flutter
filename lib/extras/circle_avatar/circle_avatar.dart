import 'package:flutter/material.dart';
import 'package:flutter_basics/assets/image_assets/image_asset.dart';
import 'package:flutter_basics/assets/web_images/web_image.dart';

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
        title: const Text("Circle Avatar Widget"),
        backgroundColor: Colors.red,
      ),
      body:const Center(
        child:  CircleAvatar(
          backgroundColor: Colors.teal,
          backgroundImage:  AssetImage(ImageAsset.wallpaper),
         // foregroundImage:  NetworkImage(WebImages.webImageURL),
          foregroundColor: Colors.pink,
          radius: 50,
          child:  Text("Child Widget"),

        ),
      ),
    );
  }
}
