import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tiffin_flutter/app_routes.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

Future<void> main() async {
  // Load the environment variables from the .env file
  await dotenv.load(fileName: ".env");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: TiffinAppTheme.lightTheme,
      initialRoute: RouteNames.login.route,
      routes: tiffinAppRoutes,
    );
  }
}
