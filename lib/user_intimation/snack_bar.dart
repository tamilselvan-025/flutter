import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(getSnackBar(const Text("SnackBar ......!"), context));
          },
          child: const Text("Click..!"),
        ),
      ),
    );
  }
}

SnackBar getSnackBar(Widget data, BuildContext context) {
  return SnackBar(
    margin: const EdgeInsets.only(bottom: 100),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      onPressed: () {
        // code to pop the snack bar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      label: "undo",
    ),
    closeIconColor: Colors.green,
    content: data,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.red[400],
    padding: const EdgeInsets.all(10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.elliptical(10, 5), left: Radius.elliptical(10, 5)),
      side: BorderSide(
        color: Color(0xFFD32F2F),
        width: 2,
      ),
    ),
    elevation: 20,
    //showCloseIcon: true,
  );
}
