// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/enums/food_type.dart';
import 'package:tiffin_flutter/app/shared/models/tiffin_dto.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class TiffinCard extends StatelessWidget {
  final TiffinDTO tiffin;
  const TiffinCard({super.key, required this.tiffin});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SizedBox(
          height: 230,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image(
                      image: NetworkImage(tiffin.imageUrl),
                      width: double.infinity,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    tiffin.title,
                    style: TiffinAppTheme.heading2TextStyle,
                  ),
                  Text(
                    tiffin.description,
                    overflow: TextOverflow.ellipsis,
                    style: TiffinAppTheme.bodySmallTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Row(
                          children: [
                            FoodTypeIcon(tiffin.foodType),
                            Text(tiffin.foodType),
                          ],
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 2),
                        labelStyle: TiffinAppTheme.captionTextStyle,
                        backgroundColor: TiffinAppTheme.primaryTints[200],
                        side: BorderSide.none,
                      ),
                      Text(
                        "₹ ${tiffin.price}/-",
                        style: TiffinAppTheme.heading2TextStyle,
                      )
                    ],
                  ),
                ]),
          )),
    );
  }
}
