import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _termsCheck = false;

  registerUser() {}
  toggleTermsCheck() {
    setState(() {
      _termsCheck = !_termsCheck;
    });
  }

  redirectToLoginPage() {}

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
                Text("Create\nyour Account",
                    style: TiffinAppTheme.heading1TextStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Enter your details to get started",
                    style: TiffinAppTheme.bodySmallTextStyle,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "First Name",
                      hintStyle: TiffinAppTheme.bodyRegularTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16)),
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TiffinAppTheme.bodyRegularTextStyle,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16)),
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TiffinAppTheme.bodyRegularTextStyle,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16)),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Checkbox(
                          value: _termsCheck,
                          onChanged: (value) {
                            toggleTermsCheck();
                          }),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "I agree to the Terms and Conditions of use",
                          style: TiffinAppTheme.captionTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: registerUser, child: const Text("Register")),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TiffinAppTheme.bodySmallTextStyle,
                    ),
                    GestureDetector(
                      onTap: redirectToLoginPage,
                      child: Text(
                        "Login Now",
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
