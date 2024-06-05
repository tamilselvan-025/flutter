import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Widget"),
        backgroundColor: Colors.red,
      ),
      body:const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Text("Card without padding and custom size"),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("Card with padding and without custom size"),
              ),
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: Card(
                color: Colors.pink,
                elevation: 20,
                shadowColor: Colors.black,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.black,width: 2)
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 80),
                  child: Text("Card with padding and custom size"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
