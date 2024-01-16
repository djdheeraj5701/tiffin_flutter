import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: true,
      theme: TiffinAppTheme.lightTheme,
      initialRoute: RouteNames.home.name,
      routes: tiffinAppRoutes,
    );
  }
}
