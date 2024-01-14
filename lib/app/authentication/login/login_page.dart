import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginPageState();
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
              Text("Enter your Phone Number",
                  style: TiffinAppTheme.heading2TextStyle),
              Text(
                "We will send you the 4 digit verification code",
                style: TiffinAppTheme.bodyRegularTextStyle,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
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
