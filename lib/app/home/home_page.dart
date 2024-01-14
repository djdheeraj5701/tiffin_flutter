import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/navbar/tiffin_app_navbar.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

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
      bottomNavigationBar: TiffinAppNavbar(),
    ));
  }
}
