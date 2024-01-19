// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';

enum FoodType { veg, nonVeg, egg }

extension FoodTypeExtension on FoodType {
  String get Name {
    if (this == FoodType.veg) return "Veg";
    if (this == FoodType.nonVeg) return "Non-Veg";
    if (this == FoodType.egg) return "Egg";
    throw Exception("Food Type not found");
  }
}

FoodType getFoodTypeOf(foodType) {
  if (foodType == FoodType.veg.Name) return FoodType.veg;
  if (foodType == FoodType.nonVeg.Name) return FoodType.nonVeg;
  if (foodType == FoodType.egg.Name) return FoodType.egg;
  throw Exception("Food Type not found");
}

Widget FoodTypeIcon(String foodType) {
  late Color foodColor;
  late IconData innerIcon;

  if (getFoodTypeOf(foodType) == FoodType.veg) {
    foodColor = Colors.green;
    innerIcon = MaterialSymbols.circle_filled;
  }
  if (getFoodTypeOf(foodType) == FoodType.nonVeg) {
    foodColor = Colors.red;
    innerIcon = MaterialSymbols.change_history_filled;
  }
  if (getFoodTypeOf(foodType) == FoodType.egg) {
    foodColor = Colors.yellow.shade800;
    innerIcon = MaterialSymbols.change_history_filled;
  }
  return Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        Icons.crop_square_sharp,
        color: foodColor,
        size: 24,
      ),
      Icon(innerIcon, color: foodColor, size: 10),
    ],
  );
}
