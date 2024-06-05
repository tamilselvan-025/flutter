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
        title: const Text('Alert With Image'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Column(
                        children: [
                          Container(
                              height: 200,
                              width: 200,
                              color: Colors.black,
                              child: Image.asset(
                                ImageAsset.wallpaper,
                                fit: BoxFit.fill,
                              ),
                          ),
                          const Text("Text Widget"),
                        ],
                      ),
                    ));
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}
