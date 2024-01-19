import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/shared/enums/time_slot.dart';
import 'package:tiffin_flutter/app/shared/models/tiffin_dto.dart';
import 'package:tiffin_flutter/app/shared/utils/misc.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => redirectToPreviousPage(context),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            MaterialSymbols.arrow_back,
                            size: 24,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Text(
                        "Tiffin Summary",
                        style: TiffinAppTheme.headingSmallTextStyle,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Hero(
                    // refer: https://flutteragency.com/multiple-heroes-share-the-same-tag/
                    tag: "tiffinSummary$index",
                    child: TiffinCard(
                      tiffin: tiffinDTO,
                    )),
                const TimeSlotCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
