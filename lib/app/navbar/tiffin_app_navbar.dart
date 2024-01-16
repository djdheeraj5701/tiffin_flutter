import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class TiffinAppNavbar extends StatefulWidget {
  const TiffinAppNavbar({super.key});

  @override
  State<TiffinAppNavbar> createState() => _TiffinAppNavbarState();
}

class _TiffinAppNavbarState extends State<TiffinAppNavbar> {
  int _selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 64,
      backgroundColor: TiffinAppTheme.primaryTints[100]!,
      buttonBackgroundColor: TiffinAppTheme.primaryColor,
      color: TiffinAppTheme.primaryColor,
      index: _selectedTab,
      items: const [
        CurvedNavigationBarItem(
          child: Icon(
            MaterialSymbols.person,
            color: Colors.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            MaterialSymbols.home_outlined,
            color: Colors.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            MaterialSymbols.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedTab = index;
        });
      },
    );
  }
}
