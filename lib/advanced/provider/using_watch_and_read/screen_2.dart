import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/using_watch_and_read/model_class.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<ExampleModelClass>().value),
            TextField(
              onSubmitted: (value){
                context.read<ExampleModelClass>().changeValue(value);
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Back")
            )
          ],
        ),
      ),
    );
  }
}
