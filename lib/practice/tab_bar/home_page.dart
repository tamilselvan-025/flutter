import 'package:flutter/material.dart';
import 'package:flutter_basics/practice/tab_bar/screen1.dart';
import 'package:flutter_basics/practice/tab_bar/screen2.dart';
import 'package:flutter_basics/practice/tab_bar/screen3.dart';

void main() {
  runApp(const MaterialApp(
    home: DefaultTabController(length: 3, child: Home()),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBar example"),
        backgroundColor: Colors.teal,
        bottom: TabBar(
          tabs: const [Icon(Icons.add), Icon(Icons.account_circle_sharp), Icon(Icons.adb)],
          labelPadding: const EdgeInsets.all(20),
          labelColor: Colors.red,
          unselectedLabelColor: Colors.green,
          dividerColor: Colors.teal[100],
        ),
      ),
      body: const TabBarView(
        children: [Screen1(), Screen2(), Screen3()],
      ),
    );
  }
}
