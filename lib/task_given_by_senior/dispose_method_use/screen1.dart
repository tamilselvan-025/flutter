import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/dispose_method_use/screen2.dart';

void main() {
  runApp(const MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text("Screen 1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screen2()));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }


  @override
  void deactivate() {
    debugPrint("Screen1 deactivate() called");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("Screen1 dispose() called");
    super.dispose();
  }
}
