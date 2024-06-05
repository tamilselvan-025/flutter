import 'package:flutter/material.dart';
import 'package:flutter_basics/practice/bottom_navigation_bar/screen1.dart';
import 'package:flutter_basics/practice/bottom_navigation_bar/screen2.dart';
import 'package:flutter_basics/practice/bottom_navigation_bar/screen3.dart';

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
  int _currentIndex = 0;
  final List<Widget> _tabs = [const Screen1(), const Screen2(), const Screen3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBar"),
        backgroundColor: Colors.red,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.green,
          selectedItemColor: Colors.red,
          iconSize: 30,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.connected_tv_sharp),
              label: "Screen1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.adb_sharp),
              label: "Screen2",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_call),
              label: "Screen3",
            ),


          ]),
    );
  }
}
