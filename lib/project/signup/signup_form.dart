import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/project/signup/home_page.dart';
import 'package:flutter_basics/project/signup/util/input_formatter.dart';
import 'input_decorator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  final FocusNode _focusForContactNumber = FocusNode();
  final FocusNode _focusForName = FocusNode();
  final FocusNode _focusForEmail = FocusNode();
  final FocusNode _focusForPassword = FocusNode();
  final FocusNode _focusForConfirmPassword = FocusNode();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _focusForEmail.dispose();
    _focusForPassword.dispose();
    _focusForName.dispose();
    _focusForConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formStateKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              showCursor: true,
              controller: nameController,
              focusNode: _focusForName,
              decoration:
                  loginInputDecorator(hintText: "Enter valid name", prefixIcon: Icons.person, labelWidgetText: "Name"),
              maxLength: 23,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                NameInputFormatter(),
              ],
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter name";
                } else {
                  return null;
                }
              },
              autofocus: true,
              onFieldSubmitted: (_) {
                _focusForEmail.requestFocus();
                debugPrint('Name :  ${nameController.text}');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              focusNode: _focusForEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: loginInputDecorator(
                hintText: "Enter valid email",
                labelWidgetText: "Email",
                prefixIcon: Icons.email,
              ),
              maxLength: 40,
              autofocus: true,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter email";
                }
                else {
                  return null;
                }
              },
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              onFieldSubmitted: (_) {
                _focusForPassword.requestFocus();
                debugPrint('Email :  ${emailController.text}');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              focusNode: _focusForPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: loginInputDecorator(
                hintText: "Enter password",
                labelWidgetText: "Password",
                prefixIcon: Icons.remove_red_eye,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                  onPressed: () {
                    isPasswordVisible = !isPasswordVisible;
                    setState(() {});
                  },
                  isSelected: isPasswordVisible,
                  selectedIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                ),
              ),
              maxLength: 15,
              autofocus: true,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null) return ' ';
                if (value.isEmpty) return 'Password is empty';
                if (value.length < 8) {
                  return "Password should contain minimum 8 characters";
                }
                if (value.length >= 8 && value.length <= 15) {
                  return null;
                }
                return "Password should contain 8-15 characters";
              },
              obscureText: !isPasswordVisible,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              onFieldSubmitted: (_) {
                _focusForConfirmPassword.requestFocus();
                debugPrint('Password :  ${passwordController.text}');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              focusNode: _focusForConfirmPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: loginInputDecorator(
                  hintText: "Confirm password", labelWidgetText: "Confirm Password", prefixIcon: Icons.lock),
              maxLength: 23,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null) return ' ';
                if (value == passwordController.text) return null;
                return "Password didn't match";
              },
              obscureText: true,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              onFieldSubmitted: (_) {
                _focusForContactNumber.requestFocus();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: contactNumberController,
              focusNode: _focusForContactNumber,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: loginInputDecorator(
                  hintText: "Enter Contact Number", labelWidgetText: "Contact Number", prefixIcon: Icons.call),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null) return 'Enter valid contact number';
                if (value.length < 10) return 'contact number should contain 10 digits';
                return null;
              },
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formStateKey.currentState!.validate()) {
                  debugPrint("-----------------------");
                  debugPrint("Name     : ${nameController.text}");
                  debugPrint("Email    : ${emailController.text}");
                  debugPrint("Password : ${passwordController.text}");
                  debugPrint("-----------------------");
                  _formStateKey.currentState!.save();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home(nameController.text)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 2,
                  color: Colors.black26,
                ),
                shadowColor: Colors.black26,
                elevation: 25,
                backgroundColor: Colors.blue.shade400,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(7),
                fixedSize: const Size(200, 60),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 5),
                  ],
                  letterSpacing: 3,
                  fontFamily: 'Times',
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              child: const Text(
                "Erase All...!",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  height: 1,
                  decorationThickness: 1,
                  fontWeight: FontWeight.w500,
                  backgroundColor: Colors.white10,
                ),
              ),
              onPressed: () {
                passwordController.clear();
                _formStateKey.currentState?.reset();
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                contactNumberController.clear();
                setState(() {});
                FocusScope.of(context).requestFocus(_focusForName);
                debugPrint('---------reset called---------');
                debugPrint("Name     : ${nameController.text}");
                debugPrint("Email    : ${emailController.text}");
                debugPrint("Password : ${passwordController.text}");
                debugPrint("Contact Number : ${contactNumberController.text}");
                debugPrint("-----------------------");

              },
            ),
          ],
        ),
      ),
    );
  }
}
