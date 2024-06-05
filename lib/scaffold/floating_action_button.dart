import 'package:flutter/material.dart';
import 'package:flutter_basics/stateful/counter_app.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      body: const Center(
        child: Text("Center text"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("floatingActionButton clicked");
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          });
        },
        backgroundColor: Colors.red,
        splashColor: Colors.deepPurple,
        tooltip: "FloatingActionButton",
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}
