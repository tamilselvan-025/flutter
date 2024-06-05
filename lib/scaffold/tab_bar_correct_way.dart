import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Specify the number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Example App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Action to perform when search icon is pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Action to perform when more icon is pressed
                },
              ),
            ],
            bottom: TabBar( // Define TabBar within the bottom property
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          body: TabBarView( // Define TabBarView to manage tab content
            children: [
              Center(child: Text('Tab 1 content')),
              Center(child: Text('Tab 2 content')),
              Center(child: Text('Tab 3 content')),
            ],
          ),
        ),
      ),
    );
  }
}
