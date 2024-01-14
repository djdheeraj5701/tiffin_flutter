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

  redirectToSignUpPage() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 96, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login with \nyour Phone Number",
                    style: TiffinAppTheme.heading1TextStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "We'll send you the 4 digit verification code",
                    style: TiffinAppTheme.bodySmallTextStyle,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                      hintStyle: TiffinAppTheme.bodyRegularTextStyle,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: generateOTP,
                        child: const Text("Generate OTP")),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TiffinAppTheme.bodySmallTextStyle,
                    ),
                    GestureDetector(
                      onTap: redirectToSignUpPage,
                      child: Text(
                        "Register Now",
                        style: TiffinAppTheme.bodySmallTextStyle.copyWith(
                            color: TiffinAppTheme.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: TiffinAppTheme.primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
