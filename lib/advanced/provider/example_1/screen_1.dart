import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/example_1/data_class.dart';
import 'package:flutter_basics/advanced/provider/example_1/screen_2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DataClass(),
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
        title: const Text("Screen 1"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DataClass>(builder: (context, dataClassObject, child) {
              return Text("${dataClassObject.integerData}");
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
                },
                child: const Text("Screen 2"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DataClass>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
