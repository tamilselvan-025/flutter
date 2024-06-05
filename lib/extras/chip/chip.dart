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
        title: const Text("Chip Widget"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        //Chip widget shows elevation only around the onDeleted callback(Not on label Widget)
        child: Chip(
          label: const Text("Chip Button"),
          elevation: 30,
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.pink,
          avatar: const Icon(Icons.account_circle_sharp),
          shadowColor: Colors.blue,
          deleteIconColor: Colors.green,
          deleteButtonTooltipMessage: "deleteButtonTooltipMessage",
          onDeleted: (){
            debugPrint("onDeleted called");
          },
        ),
      ),
    );
  }
}
