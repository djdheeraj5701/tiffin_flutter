// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class CouponOffer extends StatelessWidget {
  const CouponOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        elevation: 8,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey.shade100,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get 10% OFF for your first order",
                      style: TiffinAppTheme.bodySmallTextStyle
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Divider(),
                    Chip(
                      side: BorderSide(color: TiffinAppTheme.primaryColor),
                      label: Text(
                        "FIRSTORDER",
                        style: TiffinAppTheme.captionTextStyle
                            .copyWith(color: TiffinAppTheme.primaryColor),
                      ),
                      color: MaterialStatePropertyAll(
                          TiffinAppTheme.primaryTints[100]),
                    )
                  ],
                ))),
      ),
    );
  }
}
