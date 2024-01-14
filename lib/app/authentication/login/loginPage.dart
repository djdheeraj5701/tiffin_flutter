import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  generateOTP() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Enter your Phone Number"),
              const Text("We will send you the 4 digit verification code"),
              ElevatedButton(
                  onPressed: generateOTP, child: const Text("Generate OTP")),
              const Row(
                children: [
                  Text("Don't have an account?"),
                  Text("Register Now")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
