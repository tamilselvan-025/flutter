import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/provider/consumer_and_selector/model_class.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ExampleModelClass(),
    child: const MaterialApp(
      home: Home(),
    ),
  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumer and Selector"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
              child: Consumer<ExampleModelClass>(builder: (context, object, _) {
                debugPrint("Consumer called");
                return Text("integerValue : ${object.integerValue}, stringValue: ${object.stringValue}");
              }
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blue,
              child: Selector<ExampleModelClass,int>(builder: (_, intValue,__) {
                debugPrint("Selector called");
                return Text("integerValue : $intValue,");
              },
                selector: (_,object){
                return object.integerValue;
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              context.read<ExampleModelClass>().addInteger();
            }, child: const Text("Add")),
            ElevatedButton(onPressed: (){
              context.read<ExampleModelClass>().addString();
            }, child: const Text("Add 't' to String value")),
          ],
        ),
      ),
    );
  }
}
