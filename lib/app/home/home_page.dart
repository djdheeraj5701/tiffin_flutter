import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_card.dart';
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: TiffinAppTheme.primaryTints[100],
      body: const Column(
        children: [
          TiffinCard(),
          TiffinCard(),
        ],
      ),
      bottomNavigationBar: TiffinAppNavbar(),
    ));
  }
}
