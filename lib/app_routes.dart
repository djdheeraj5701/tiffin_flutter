// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/authentication/login/login_page.dart';
import 'package:tiffin_flutter/app/authentication/otp/otp_page.dart';
import 'package:tiffin_flutter/app/authentication/sign-up/sign_up_page.dart';
import 'package:tiffin_flutter/app/home/home_page.dart';
import 'package:tiffin_flutter/app/home/tiffin_summary/tiffin_summary_page.dart';
import 'package:tiffin_flutter/app/shared/widgets/address/address_page.dart';

enum RouteNames {
  login,
  signUp,
  otp,
  home,
  order,
  account,
  orderHistory,
  tiffinSummary,
  address
}

extension RouteNamesExtension on RouteNames {
  String get route {
    if (this == RouteNames.login) return "/login";
    if (this == RouteNames.signUp) return "/signup";
    if (this == RouteNames.otp) return "/otp";
    if (this == RouteNames.home) return "/home";
    if (this == RouteNames.tiffinSummary) return "/tiffin-summary";
    if (this == RouteNames.address) return "/address";
    return "/no-page";
  }
}

var tiffinAppRoutes = <String, WidgetBuilder>{
  RouteNames.login.route: (context) => LoginPage(),
  RouteNames.signUp.route: (context) => SignUpPage(),
  RouteNames.otp.route: (context) => OTPPage(),
  RouteNames.home.route: (context) => HomePage(),
  RouteNames.tiffinSummary.route: (context) => TiffinSummaryPage(),
  RouteNames.address.route: (context) => AddressPage(),
};
