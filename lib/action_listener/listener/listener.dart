import 'package:flutter/material.dart';

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
        title: const Text("Listener"),
        backgroundColor: Colors.red,
      ),
      body: Listener(
        onPointerDown: (_) {
          debugPrint('pointer is down');
        },
        onPointerMove: (_) {
          debugPrint('pointer has moved');
        },
        onPointerUp: (_) {
          debugPrint('pointer is up');
        },
        //doubts
        // onPointerPanZoomStart: (_){
        //   debugPrint('onPointerPanZoomStart');
        // },
        // onPointerPanZoomEnd: (_){
        //   debugPrint('onPointerPanZoomEnd');
        // },

        child: Center(
          child: Container(
              height: 200,
              width: 300,
              color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                  height: 100, width: 200, color: Colors.red, alignment: Alignment.center, child: const Text('Text'))),
        ),
      ),
    );
  }
}
