import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
            toolbarHeight: 70,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
            backgroundColor: Colors.deepPurple)),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      body: const TabNavigator(),
    );
  }
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 22),
            tabs: [
              IconWithName(Icons.home, Text("Home")),
              IconWithName(Icons.account_balance, Text("Bank")),
              IconWithName(Icons.ac_unit_outlined, Text("None"))
            ],
          ),
          Expanded(
              child:
                  TabBarView(children: [FirstTab(), SecondTab(), ThirdTab()])),
        ],
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tab 1 contents"),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tab 2 contents"),
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tab 3 contents"),
      ),
    );
  }
}

class IconWithName extends StatelessWidget {
  final IconData icon;
  final Text text;

  const IconWithName(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), text],
    );
  }
}
