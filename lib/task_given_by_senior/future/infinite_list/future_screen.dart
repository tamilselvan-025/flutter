import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  static const String name1 = "Vicky";
  static const String name2 = "Tamil";
  bool _isGenerate = true;

  List<Widget> nameList = [];

  @override
  void initState() {
    super.initState();
    nameGenerator();
  }

  Future<void> nameGenerator() async {
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        nameList.add(const Text(name1));
        debugPrint('Name 1 : $name1');
      });
    });
    bool isContinue = true;
    while (isContinue) {
      await Future.delayed(const Duration(seconds: 2), () {
        if (_isGenerate) {
          setState(() {
            nameList.add(const Text(name2));
            debugPrint('Name 2 : $name2');
          });
        } else {
          isContinue = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SutureScreen"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...nameList,
              ElevatedButton(
                  onPressed: () {
                    _isGenerate = false;
                    Navigator.pop(context);
                  },
                  child: const Text("Stop And Return"))
            ],
          ),
        ),
      ),
    );
  }
}
