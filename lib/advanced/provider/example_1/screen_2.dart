import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/example_1/data_class.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text("Back"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DataClass>(context, listen: false).decrement();
        },
        child: const Icon(Icons.minimize),
      ),
    );
  }
}
