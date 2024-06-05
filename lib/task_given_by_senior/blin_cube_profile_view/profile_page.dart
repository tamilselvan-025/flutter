
import 'package:flutter/material.dart';

import 'package:flutter_basics/task_given_by_senior/blin_cube_profile_view/list_view_example.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        //physics:const BouncingScrollPhysics(),

        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.green,
                padding:const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                child: const Text('line 1\nline 2\nline 3'),
              ),
              const Expanded(
                child:  ListViewExample(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
