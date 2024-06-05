import 'package:flutter/material.dart';


class ColumnContents extends StatelessWidget {
  const ColumnContents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "INR to USD",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                maxLength: 5,

                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.light,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter amount in INR",
                     hintStyle: TextStyle(color: Colors.black45)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
 TextField(
              cursorColor: Colors.redAccent,
              maxLength:10,
              style: TextStyle(color: Colors.blue),
            ),
 */
