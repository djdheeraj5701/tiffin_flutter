import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class TiffinAppNavbar extends StatefulWidget {
  const TiffinAppNavbar({super.key});

  @override
  State<TiffinAppNavbar> createState() => _TiffinAppNavbarState();
}

class _TiffinAppNavbarState extends State<TiffinAppNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: NavigationBar(
        destinations: [
          GestureDetector(
            onTap: null,
            child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  MaterialSymbols.person_outlined,
                  size: 24,
                )),
          ),
          GestureDetector(
            onTap: null,
            child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  MaterialSymbols.home,
                  size: 24,
                )),
          ),
          GestureDetector(
            onTap: null,
            child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  MaterialSymbols.shopping_cart,
                  size: 24,
                )),
          ),
        ],
      ),
    );
  }
}
