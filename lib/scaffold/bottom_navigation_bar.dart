import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home :Navigator()));
}

class Navigator extends StatefulWidget {
  const Navigator({super.key});

  @override
  State<Navigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  int indexState = 0;
  List<Widget> navigationTabs = [
    const HomePage(),
    const ProfilePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: navigationTabs[indexState],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: indexState,
        onTap: (pressedIndex) {
          setState(() {
            indexState = pressedIndex;
          });
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings",backgroundColor:Colors.blue,),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ProfilePage"),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SettingsPage"),
      ),
    );
  }
}
