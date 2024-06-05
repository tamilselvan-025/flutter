import 'package:flutter/material.dart';
import 'package:flutter_basics/scaffold/navigation_drawer_with_appbar_actions/drawer_page.dart';
import 'package:flutter_basics/scaffold/navigation_drawer_with_appbar_actions/setting_page.dart';


void main() {
  runApp(const MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Setting()));
        }, icon: const Icon(Icons.settings)),
        ],
        title: const Text(
          "Home",
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text("Home Page contents"),
      ),
      drawer: const HomePageDrawer(),

    );
  }
}
