import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
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
        title:const Text('Undetermined ProgressIndicator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[100],
                color: Colors.blue,
                strokeWidth: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


