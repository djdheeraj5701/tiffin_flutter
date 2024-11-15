import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/shared/utils/misc.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

// ignore: non_constant_identifier_names
AppBar TiffinAppBar(BuildContext context, String heading) {
  return AppBar(
    scrolledUnderElevation: 0,
    toolbarHeight: 72,
    backgroundColor: Colors.grey.shade100,
    leading: GestureDetector(
      onTap: () => redirectToPreviousPage(context),
      child: Container(
          margin: const EdgeInsets.only(left: 24),
          child: const Icon(
            MaterialSymbols.arrow_back,
            size: 24,
          )),
    ),
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        heading,
        style: TiffinAppTheme.headingSmallTextStyle,
      ),
    ),
  );
}
