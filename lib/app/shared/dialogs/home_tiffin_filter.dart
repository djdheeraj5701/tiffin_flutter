import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/navbar/tiffin_app_navbar.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

// ignore: non_constant_identifier_names
Widget HomeTiffinFilterDialog() {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    surfaceTintColor: Colors.white,
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TiffinAppTheme.headingRegularTextStyle,
          ),
          Wrap(
            spacing: 5.0,
            children: [
              ChoiceChip(
                label: Text(
                  'Veg',
                  style: TiffinAppTheme.captionTextStyle
                      .copyWith(color: Colors.black),
                ),
                selected: true,
                onSelected: null,
              ),
              ChoiceChip(
                label: Text('Non-Veg'),
                selected: false,
                onSelected: null,
              ),
              ChoiceChip(
                label: Text('Egg'),
                selected: false,
                onSelected: null,
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      ElevatedButton(
          style: TiffinAppTheme.elevatedButtonStyle.copyWith(
              foregroundColor: const MaterialStatePropertyAll(Colors.black),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              side: const MaterialStatePropertyAll(BorderSide(width: 1))),
          onPressed: null,
          child: const Text("Reset")),
      const ElevatedButton(onPressed: null, child: Text("Apply"))
    ],
  );
}
