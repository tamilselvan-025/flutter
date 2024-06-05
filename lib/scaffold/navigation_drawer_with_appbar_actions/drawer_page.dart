import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/second_screen.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/until_functions/home_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Page 1'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            title: const Text('Page 2'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
            },
          ),
        ],
      ),
    );
  }
}
