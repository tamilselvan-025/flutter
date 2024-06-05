import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/navigation/route_generate.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generate,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
      ),
    ),
  ));
}

class FirstScreen extends StatelessWidget {
  final String? navigation;

  const FirstScreen({this.navigation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(navigation == null ? "" : navigation!),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/second', arguments: 'Screen 1 to Screen 2');
              },
              child: const Text("Screen 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/third', arguments: 'Screen 1 to Screen 3');
              },
              child: const Text("Screen 3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/fourth', arguments: 'Screen 1 to Screen 4');
              },
              child: const Text("Screen 4"),
            ),
          ],
        ),
      ),
    );
  }
}
