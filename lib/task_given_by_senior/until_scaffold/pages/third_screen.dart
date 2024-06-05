import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/fourth_screen.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/fifth_screen.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/sixth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _indexState = 0;
  List<Widget> navigationTabs = [
    const SixthScreen(),
    const FourthScreen(),
    const FifthScreen(),
    const FourthScreen(),
    const FourthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Third Screen"),
      ),
      body: navigationTabs[_indexState],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        currentIndex: _indexState,
        onTap: (currentIndexValue) {
          setState(() {
            _indexState = currentIndexValue;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: "Screen 6",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm),
              label: "Screen 4",
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm),
              label: "Screen 4",
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Screen 5"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: "Screen 7"),
        ],
      ),
    );
  }
}
