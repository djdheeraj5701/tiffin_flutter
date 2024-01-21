// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
          height: 240,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tiffin.title,
                        style: TiffinAppTheme.headingSmallTextStyle,
                      ),
                      Container(
                        width: 44,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color(0xffffd065),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MaterialSymbols.star_filled,
                              size: 14,
                            ),
                            Text(
                              "${tiffin.rating}",
                              style: TiffinAppTheme.captionTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
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
                        backgroundColor: TiffinAppTheme.primaryTints[200],
                        side: BorderSide.none,
                      ),
                      Text(
                        "₹ ${tiffin.price}/-",
                        style: TiffinAppTheme.headingSmallTextStyle,
                      )
                    ],
                  ),
                ]),
          )),
    );
  }
}
