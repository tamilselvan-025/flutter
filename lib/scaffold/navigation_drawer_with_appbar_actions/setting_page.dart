import 'package:flutter/material.dart';
import 'package:flutter_basics/scaffold/tab_bar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: const Column(
          children: [
            IconWithName(Icons.person, Text("Update Profile")),
            IconWithName(Icons.dark_mode, Text("Change to dark mode")),
            IconWithName(Icons.login, Text("login another account")),
            IconWithName(Icons.delete, Text("Delete account")),
          ],
        ));
  }
}
