import 'package:flutter/material.dart';
import 'package:flutter_basics/task_given_by_senior/future/infinite_list/future_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.red,
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const FutureScreen()));
      }, child: const Text("Click")),),
    );
  }
}
