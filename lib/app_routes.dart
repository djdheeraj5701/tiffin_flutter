// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/authentication/login/login_page.dart';
import 'package:tiffin_flutter/app/authentication/otp/otp_page.dart';
import 'package:tiffin_flutter/app/authentication/signUp/sign_up_page.dart';

var tiffinAppRoutes = <String, WidgetBuilder>{
  "/login": (context) => LoginPage(),
  "/signUp": (context) => SignUpPage(),
  "/otp": (context) => OTPPage(),
  "/home": (context) => Container(),
  "/order": (context) => Container(),
  "/account": (context) => Container(),
  "/order-history": (context) => Container(),
};
