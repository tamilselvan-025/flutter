import 'package:flutter/material.dart';
import 'package:flutter_basics/project/signup/signup_form.dart';

void main() {
  runApp(const MaterialApp(
    home: SignUp(),
    debugShowCheckedModeBanner: false,
  ));
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignUp',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blueAccent,
        toolbarHeight: 60,
      ),
      body:const SingleChildScrollView(
        physics:AlwaysScrollableScrollPhysics(),
        child:  Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text.rich(
                TextSpan(
                    text: "Create an account \n",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 2,
                    ),
                    children: [
                      TextSpan(
                        text: '          Join Now !',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ]),
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
