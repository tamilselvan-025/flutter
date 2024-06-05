import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data'; // For handling byte data

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Uint8List> futureImageBytes;

  @override
  void initState() {
    super.initState();
    futureImageBytes = fetchImageBytes();
  }

  Future<Uint8List> fetchImageBytes()  {
    final url = Uri.parse('https://dummyjson.com/image/150');
    return  http.readBytes(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP ReadBytes'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: futureImageBytes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Image.memory(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
