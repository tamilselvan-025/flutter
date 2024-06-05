import 'package:flutter/material.dart';

//Not the way to code (should be achieved with the help of Stateful Widgets)
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    title: 'State Less',
  ));
}
int _count=0;
class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    debugPrint('home build called');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.cyan,
        titleTextStyle: const TextStyle(height: 2),
        title: const Center(
            child: Text(
              'Stateless Widget',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            )),
      ),
      body: Column(
        children: [
          Text("You has pressed the button $_count times"),
          FloatingActionButton(
            onPressed: () {
              _count++;
              debugPrint("$_count");
              const MyApp();//we can't trigger a rebuild(because there is no setState())
            },
          ),
        ],
      ),
    );
  }

}






