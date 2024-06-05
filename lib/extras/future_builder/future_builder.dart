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
  Future<int> futureDemo = _futureDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: futureDemo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            } else if (snapshot.hasData) {
              return Center(
                child: Text("Data : ${snapshot.data!}"),
              );
            }
            else if(snapshot.hasError){
              return Center(
                child: Text("Error ! : ${snapshot.error!}"),
              );
          }
            else {
              return const Center(
                child: Text("else called"),
              );
            }
          },
        ),
      ),
    );
  }
}

Future<int> _futureDemo() {
  return Future.delayed(const Duration(seconds: 5), () => 10);
}
