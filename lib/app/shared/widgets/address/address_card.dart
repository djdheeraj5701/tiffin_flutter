// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class AddressCard extends StatefulWidget {
  AddressCard({super.key, required this.primaryAddress});
  String primaryAddress;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  void initState() {
    super.initState();
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Delivery Address",
                style: TiffinAppTheme.bodyLargeTextStyle
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              Text(
                widget.primaryAddress,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ]),
          )),
    );
  }
}
