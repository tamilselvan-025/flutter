import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = "Tamil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InkWell"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.deepPurple,
            highlightColor: Colors.orange,
            onTap: () {
              setState(() {
                if (_text == 'Tamil') {
                  _text = "selvan";
                } else {
                  _text = 'Tamil';
                }
                // debugPrint("setState called");
              });
            },
            child: Container(
                height: 200,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child:  Text(_text),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (_text == 'Tamil') {
                  _text = "selvan";
                } else {
                  _text = 'Tamil';
                }
                // debugPrint("setState called");
              });
            },
            child: Container(
              height: 300,
              width: 400,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(_text),
            ),
          )
        ],
      )),
    );
  }
}
