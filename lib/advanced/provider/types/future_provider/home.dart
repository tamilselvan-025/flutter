
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(FutureProvider<String>(create: (_) => getName(),
      initialData: "Loading...",
    catchError: (_,__){
    return "Error occurred";
    },
    child: const MaterialApp(home: Home(),),
  )
  );
}

Future<String>getName() {
  return Future.delayed(const Duration(seconds: 5),()=>"Tamil");
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Consumer<String>(builder: (_,futureValue,__){
          return Text("futureValue $futureValue");
        }),
      ),
    );
  }
}
