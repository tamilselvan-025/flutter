import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/on_generate_and_unknown/route_generator.dart';

void main() {
  runApp(const MaterialApp(
    initialRoute: '/',
     onGenerateRoute: RouteGenerator.generate,
     onUnknownRoute:  RouteGenerator.generateUnknown,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/next', arguments: "Tamil");
          },
          child: const Text("Next Page")),
    );
  }
}
