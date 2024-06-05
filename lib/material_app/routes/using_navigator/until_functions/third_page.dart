import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static String routeName = '/third';

  const ThirdPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Third Page Contents"),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                      context,
                      (route) =>
                          route.isFirst); //to go to the first screen in stack
                  //Navigator.of(context).popUntil(ModalRoute.withName('/second'));//to go to middle of the screens in stack
                },
                child: const Text("Back To Home using (popUntil)")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/fourth',
                      (route) => route
                          .isFirst); //first it will push the new screen and the it pops all the screen until the condition is true
                },
                child: const Text("fourth page using pushNamedAndRemoveUntil")),
          ],
        ),
      ),
    );
  }
}
