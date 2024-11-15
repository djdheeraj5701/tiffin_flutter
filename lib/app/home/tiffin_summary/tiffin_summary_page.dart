import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/shared/models/tiffin_dto.dart';
import 'package:tiffin_flutter/app/shared/utils/misc.dart';
import 'package:tiffin_flutter/app/shared/widgets/address/address_card.dart';
import 'package:tiffin_flutter/app/shared/widgets/coupon/coupon_card.dart';
import 'package:tiffin_flutter/app/shared/widgets/razorpay_checkout.dart';
import 'package:tiffin_flutter/app/shared/widgets/receipt_card.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_app_bar.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_card.dart';
import 'package:tiffin_flutter/app/shared/widgets/time_slot_card.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class TiffinSummaryPage extends StatefulWidget {
  const TiffinSummaryPage({super.key});

  @override
  State<TiffinSummaryPage> createState() => _TiffinSummaryPageState();
}

class _TiffinSummaryPageState extends State<TiffinSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)?.settings.arguments as Map;
    final TiffinDTO tiffinDTO = args["tiffinDTO"];
    final int index = args["index"];
    return SafeArea(
      child: Scaffold(
        appBar: TiffinAppBar(context, "Tiffin Summary"),
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    // refer: https://flutteragency.com/multiple-heroes-share-the-same-tag/
                    tag: "tiffinSummary$index",
                    child: TiffinCard(
                      tiffin: tiffinDTO,
                    )),
                const TimeSlotCard(),
                AddressCard(primaryAddress: "Vimannagar",),
                const CouponCard(),
                const ReceiptCard(),
                const RazorpayCheckoutButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
