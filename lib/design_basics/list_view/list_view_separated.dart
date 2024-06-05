import 'package:flutter/material.dart';
import 'package:flutter_basics/design_basics/list_view/list_view_builder.dart';

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
        title: const Text("ListView.separated()"),
        backgroundColor: Colors.red,
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return getWidget(index + 1);
        },
        separatorBuilder: (BuildContext context, int index) {
          return (index + 1) % 10 == 0
              ? Container(
                  height: 50,
                  color: Colors.blue,
                  child: const Text("Advertisement"),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                );
        },
      ),
    );
  }
}
