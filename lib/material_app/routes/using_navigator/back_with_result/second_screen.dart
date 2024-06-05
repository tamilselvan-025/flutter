import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Enter email"),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: "Enter Password"),
              ),
              ElevatedButton(
                onPressed: () {
                  Map<String, String> dataMap = {};
                  dataMap.putIfAbsent("email", () => _emailController.text);
                  dataMap.putIfAbsent("password", () => _passwordController.text);
                  Navigator.pop(context,dataMap);
                },
                child: const Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
