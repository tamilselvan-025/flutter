import 'package:flutter/material.dart';
import 'package:flutter_basics/extras/value_notifier/model_class.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Counter(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ValueNotifier"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          alignment: Alignment.center,
          color: Colors.blue,
          child: ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, child) {
              return Column(
                children: [
                  Text("value : $value"),
                  child ?? const CircularProgressIndicator()
                ],
              );
              },
            child: const Text("ValueListenableBuilder child widget"),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
