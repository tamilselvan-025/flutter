import 'package:flutter/material.dart';

void main(){
 runApp(const MaterialApp(home: Home(),)) ;
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopUpMenuButton'), actions: [
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem(value: "option 1", child: Text("option 1"),),
            const PopupMenuItem(value: "option 2", child: Text("option 2"),),
            const PopupMenuItem(value: "option 3", child: Text("option 3"),),
          ];
        },
          onSelected: (value) {
            debugPrint('$value is pressed');
          },
          elevation: 10,
          initialValue:'option 2',

        )
      ],
      ),
    );
  }
}
