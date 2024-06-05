import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet Widget"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              elevation: 30,
              useSafeArea: true,
              builder: (_) {
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  color: Colors.red[100],
                  alignment: Alignment.center,
                  child: const Text("Bottom Sheet"),
                );
              });
        },
        child: const Text("Click"),
      )
      ),
    );
  }
}
