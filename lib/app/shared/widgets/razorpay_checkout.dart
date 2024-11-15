import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class RazorpayCheckoutButton extends StatefulWidget {
  const RazorpayCheckoutButton({super.key});

  @override
  State<RazorpayCheckoutButton> createState() => _RazorpayCheckoutButtonState();
}

class _RazorpayCheckoutButtonState extends State<RazorpayCheckoutButton> {
  final Razorpay _razorpay = Razorpay();

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  // NOTE: ios changes need to be done + proguard rules
  openRazorpayPage() async {
    String razorpayKeyId = dotenv.env['RAZORPAY_KEY_ID']!;
    String razorpayKeySecret = dotenv.env['RAZORPAY_KEY_SECRET']!;

    String base64Token =
        base64Url.encode(utf8.encode("$razorpayKeyId:$razorpayKeySecret"));

    // this will be done and received from backend => orderId
    var response = await http.post(
        Uri.parse("https://api.razorpay.com/v1/orders"),
        headers: {
          "Authorization": "Basic $base64Token",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "amount": 500 * 100,
          "currency": "INR",
        }));

    String orderId = jsonDecode(response.body)["id"];

    var options = {
      'key': razorpayKeyId,
      'amount': 500 * 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 600, // in seconds
      'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'},
      'payment_capture': "1"
    };

    _razorpay.open(options);
  }

  @override
  void initState() {
    super.initState();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        onPressed: openRazorpayPage,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Checkout"), Icon(Icons.arrow_right_alt)],
        ),
      ),
    );
  }
}
