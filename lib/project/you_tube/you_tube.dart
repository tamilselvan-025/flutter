import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/project/you_tube/notification_page.dart';
import 'package:flutter_basics/project/you_tube/search_page.dart';
import 'package:flutter_basics/project/you_tube/stream_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.play_circle_fill_rounded,
              color: Colors.red,
            ),
            Text(
              "YouTube",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StreamPage()));
            },
            icon: const Icon(Icons.live_tv_outlined),
            color: Colors.white,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              icon: const Icon(Icons.notifications, color: Colors.white)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search, color: Colors.white)),
        ],
        backgroundColor: Colors.black,
      ),
    );
  }
}
