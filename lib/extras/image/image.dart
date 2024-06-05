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
        title: const Text("Image"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Image.asset()"),
              SizedBox(height: 200,width:200,child: Image.asset(ImageAsset.wallpaper)),
            ],
          ),
          Row(
            children: [
              const Text("Image.network()"),
              SizedBox(height: 200,width:200,child: Image.network(WebImages.webImageURL,)),
            ],
          ),
        ],
      ),
    );
  }
}
