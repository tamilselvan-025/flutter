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
        title: const Text("GridView.count()"),
        backgroundColor: Colors.red,
      ),

      body: GridView.builder(
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          mainAxisExtent: 100
        ),
        itemCount: 50,
        itemBuilder: (BuildContext context,int index){
          return getWidget(index+1);
        },
        padding:const EdgeInsets.all(10),
        physics: const PageScrollPhysics(),
      ),
    );
  }
}
