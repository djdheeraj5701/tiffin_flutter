import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  regenerateOTP() {}

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
                Text("OTP\nVerification",
                    style: TiffinAppTheme.heading1TextStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Enter the verification code sent on your phone number",
                    style: TiffinAppTheme.bodySmallTextStyle,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: regenerateOTP,
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
                      onTap: redirectToLoginPage,
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
