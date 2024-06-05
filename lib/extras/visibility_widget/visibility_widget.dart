import 'package:flutter/material.dart';
import 'package:flutter_basics/extras/visibility_widget/change_visibility.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ChangeVisibility(),
    child: const MaterialApp(
      home: Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visibility Widget"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ChangeVisibility>(builder: (context,visibilityObject,child){
              return TextButton(
                  onPressed: () {
                   visibilityObject.changeVisibility();
                  },
                  child: Text(visibilityObject.text));
            }),
        Consumer<ChangeVisibility>(builder: (context,visibilityObject,child){
          return  Visibility(
            visible: visibilityObject.isVisible,
            replacement: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: double.infinity,
              color: Colors.blue[300],
              alignment: Alignment.center,
              child: const Text("Replacement Widget"),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: double.infinity,
              color: Colors.red[300],

            ),
            

          );
        }),

          ],
        ),
      ),
    );
  }
}
