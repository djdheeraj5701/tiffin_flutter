import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/navbar/tiffin_app_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Text("Home page"),
      bottomNavigationBar: TiffinAppNavbar(),
    ));
  }
}
