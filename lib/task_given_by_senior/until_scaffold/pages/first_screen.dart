import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/fifth_screen.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/fourth_screen.dart';

import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/settings_screen.dart';
import 'package:flutter_basics/task_given_by_senior/until_scaffold/pages/third_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const FirstPage(),
      '/home': (context) => const HomeScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer:const Drawer(),
        appBar: AppBar(
          elevation: 40,
          backgroundColor: Colors.purple,
          title: const Text("Demo"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: const Icon(Icons.settings))
          ],
          bottom: const TabBar(

           dividerColor: Colors.black26,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,

            tabs: [
              Icon(Icons.looks_one_rounded),
              Icon(Icons.looks_two_rounded),
              Icon(Icons.adb_sharp)
            ],
          ),
        ),
        body: const TabBarView(
            children: [ThirdScreen(), FourthScreen(), FifthScreen()]),
      ),
    );
  }
}
