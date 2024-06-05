import 'package:flutter/material.dart';
import 'package:flutter_basics/project/home_page.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/until_functions/first_page.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/until_functions/fourth_page.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/until_functions/second_page.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/until_functions/third_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.cyan)),

    routes: {
      HomePage.routeName: (context) => const HomePage(),
      FirstPage.routeName: (context) => const FirstPage(),
      SecondPage.routeName: (context) => const SecondPage(),
      ThirdPage.routeName: (context) => const ThirdPage(),
      FourthPage.routeName: (context)=> const FourthPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  static String routeName='/';
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Home Page Contents"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
                child: const Text("First Page")),

          ],
        ),
      ),
    );
  }
}
