import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home:Home(),));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("StreamBuilder"),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<int>(stream: _getNumbers(), builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const LinearProgressIndicator();
        }
        else if(snapshot.hasData){
          return Center(
            child: Text("Value : ${snapshot.data}"),
          );
        }
        return Center(
          child: Text("Error : ${snapshot.error}"),
        );
      }
      ),

    );
  }
}


Stream<int> _getNumbers() async* {
  for (int i = 1; i <= 100; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}