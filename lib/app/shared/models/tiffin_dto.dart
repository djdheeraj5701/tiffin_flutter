import 'package:tiffin_flutter/app/shared/enums/food_type.dart';

class TiffinDTO {
  String imageUrl;
  String title;
  String description;
  int price;
  String foodType;

  TiffinDTO(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.price,
      required this.foodType});
}
