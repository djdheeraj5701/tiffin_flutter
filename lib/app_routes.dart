// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/authentication/login/login_page.dart';
import 'package:tiffin_flutter/app/authentication/otp/otp_page.dart';
import 'package:tiffin_flutter/app/authentication/sign-up/sign_up_page.dart';
import 'package:tiffin_flutter/app/home/home_page.dart';

enum RouteNames  {
  login, signUp, otp, home, order, account, orderHistory
}

extension RouteNamesExtension on RouteNames {
  String get name {
    if (this == RouteNames.login) return "/login";
    if (this == RouteNames.signUp) return "/signup";
    if (this == RouteNames.otp) return "/otp";
    if (this == RouteNames.home) return "/home";
    return "/no-page";
  }
}

var tiffinAppRoutes = <String, WidgetBuilder>{
  RouteNames.login.name: (context) => LoginPage(),
  RouteNames.signUp.name: (context) => SignUpPage(),
  RouteNames.otp.name: (context) => OTPPage(),
  RouteNames.home.name: (context) => HomePage(),
};
