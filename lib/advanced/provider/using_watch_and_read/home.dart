import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/using_watch_and_read/model_class.dart';
import 'package:flutter_basics/advanced/provider/using_watch_and_read/screen_2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ExampleModelClass()),
    ],
    child: const MaterialApp(
      home: Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using watch and read"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(context.watch<ExampleModelClass>().value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
        },
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
