// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/authentication/login/login_page.dart';
import 'package:tiffin_flutter/app/authentication/otp/otp_page.dart';
import 'package:tiffin_flutter/app/authentication/sign-up/sign_up_page.dart';
import 'package:tiffin_flutter/app/home/home_page.dart';
import 'package:tiffin_flutter/app/home/tiffin_order/tiffin_order_page.dart';

enum RouteNames {
  login,
  signUp,
  otp,
  home,
  order,
  account,
  orderHistory,
  tiffinOrder
}

extension RouteNamesExtension on RouteNames {
  String get Name {
    if (this == RouteNames.login) return "/login";
    if (this == RouteNames.signUp) return "/signup";
    if (this == RouteNames.otp) return "/otp";
    if (this == RouteNames.home) return "/home";
    if (this == RouteNames.tiffinOrder) return "/tiffin-order";
    return "/no-page";
  }
}

var tiffinAppRoutes = <String, WidgetBuilder>{
  RouteNames.login.Name: (context) => LoginPage(),
  RouteNames.signUp.Name: (context) => SignUpPage(),
  RouteNames.otp.Name: (context) => OTPPage(),
  RouteNames.home.Name: (context) => HomePage(),
  RouteNames.tiffinOrder.Name: (context) => TiffinOrderPage(),
};
