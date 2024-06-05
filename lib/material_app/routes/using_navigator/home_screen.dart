import 'package:flutter/material.dart';

import 'package:flutter_basics/material_app/routes/using_navigator/first_screen.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/second_screen.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/third_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    theme:
        ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan)),
    routes: {
      '/': (context) => const HomeScreen(),
      '/second': (context) => const SecondScreen(),
      '/third': (context) => const ThirdScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("This is the contents in home page"),
            FloatingActionButton(
              //using push()
              child: const Text('1'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text("Second Page")),
          ],
        ),
      ),
    );
  }
}
