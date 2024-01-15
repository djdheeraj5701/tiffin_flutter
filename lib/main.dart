import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/authentication/login/login_page.dart';
import 'package:tiffin_flutter/app_routes.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TiffinAppTheme.lightTheme,
      initialRoute: RouteNames.login.name,
      routes: tiffinAppRoutes,
    );
  }
}
