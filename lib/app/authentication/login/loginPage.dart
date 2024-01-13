import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  generateOTP() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Enter your Phone Number"),
            Text("We will send you the 4 digit verification code"),

            ElevatedButton(
                onPressed: generateOTP,
                child: const Text("Generate OTP")
            ),
            Row(
              children: [Text("Don't have an account?"), Text("Register Now")],
            )
          ],
        ),
      ),
    );
  }
}
