import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  verifyOTP() {}
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
                OtpTextField(
                  autoFocus: true,
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  fieldWidth: 64,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  borderColor: TiffinAppTheme.primaryColor,
                  focusedBorderColor: TiffinAppTheme.primaryColor,
                  enabledBorderColor: TiffinAppTheme
                      .primaryTints[400]!, // ! is a bang; null check at runtime
                  borderRadius: BorderRadius.circular(8),
                  showCursor: true,
                  styles: [
                    TiffinAppTheme.heading1TextStyle
                        .copyWith(color: TiffinAppTheme.primaryColor),
                    TiffinAppTheme.heading1TextStyle
                        .copyWith(color: TiffinAppTheme.primaryColor),
                    TiffinAppTheme.heading1TextStyle
                        .copyWith(color: TiffinAppTheme.primaryColor),
                    TiffinAppTheme.heading1TextStyle
                        .copyWith(color: TiffinAppTheme.primaryColor)
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: verifyOTP, child: const Text("Verify")),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive code? ",
                      style: TiffinAppTheme.bodySmallTextStyle,
                    ),
                    GestureDetector(
                      onTap: regenerateOTP,
                      child: Text(
                        "Resend",
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
