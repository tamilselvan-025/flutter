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
        title: const Text("ListView.builder()"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: 50,
        cacheExtent:500,
        physics:const BouncingScrollPhysics(),
        padding:const EdgeInsets.all(30),
        itemBuilder: (BuildContext context, int index) {
          return getWidget(index+1);
        },
      ),
    );
  }
}

Container getWidget(int count) {
  debugPrint("object created for product $count");
  return Container(
    height: 200,
    width: 300,
    decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black,)
    ),
    alignment: Alignment.center,
    child:  Text("Product $count"),
  );
}