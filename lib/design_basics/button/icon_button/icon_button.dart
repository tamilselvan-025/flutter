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
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IconButton'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text("IconButton() constructor ---->  "),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BlankPage()));
                    },
                    icon: const Icon(Icons.connected_tv_sharp)),
              ],
            ),
            Row(
              children: [
                const Text("IconButton.filled() constructor ---->  "),
                IconButton.filled(
                    iconSize: 72,
                    isSelected: _isSelected,
                    selectedIcon: const Icon(Icons.volume_off),
                    onPressed: () {
                      _isSelected = !_isSelected;
                      setState(() {});
                    },
                    icon: const Icon(Icons.volume_down_outlined)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Blank Page"),
      ),
    );
  }
}
