// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/widgets/coupon/coupon_offer.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class CouponCard extends StatefulWidget {
  const CouponCard({super.key});

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  openCouponDrawer() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 32),
                      child: Text(
                        "Offers for you",
                        style: TiffinAppTheme.headingSmallTextStyle,
                      ),
                    ),
                    ...List.generate(
                        2,
                        (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectCoupon(index);
                              });
                            },
                            child: CouponOffer())),
                  ],
                ),
              ),
            ));
  }

  selectCoupon(index) {
    print("selected $index");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apply Coupons",
                    style: TiffinAppTheme.bodyLargeTextStyle
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: openCouponDrawer,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: TiffinAppTheme.primaryColor),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.discount_outlined,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ))),
    );
  }
}
