import 'package:flutter/material.dart';
import 'package:flutter_basics/design_basics/list_view/list_view_builder.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView()"),
        backgroundColor: Colors.red,
      ),
      body: GridView(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          mainAxisExtent: 400,
        ),

        padding:const EdgeInsets.all(10),
        physics:const BouncingScrollPhysics(),
        restorationId: "bhsafgahfa",
        cacheExtent: 500,
        children: [
          getWidget(1),
          getWidget(2),
          getWidget(3),
          getWidget(4),
          getWidget(5),
          getWidget(6),
          getWidget(7),
          getWidget(8),
          getWidget(9),
          getWidget(10),
          getWidget(11),
          getWidget(12),
        ],
       //scrollDirection: Axis.horizontal,
      ),
    );
  }
}

