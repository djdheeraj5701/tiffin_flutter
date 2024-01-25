import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class AddressCard extends StatefulWidget {
  AddressCard({super.key, this.primaryAddress = ""});
  final String primaryAddress;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool canEditAddress = false;
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = widget.primaryAddress;
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Delivery Address",
                  style: TiffinAppTheme.bodyLargeTextStyle
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        canEditAddress = !canEditAddress;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: TiffinAppTheme.primaryColor),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          canEditAddress
                              ? MaterialSymbols.save
                              : MaterialSymbols.edit,
                          size: 24,
                          color: Colors.white,
                        )),
                  ),
                ),
              ]),
              canEditAddress
                  ? TextField(
                      minLines: 2,
                      maxLines: 4,
                      controller: addressController,
                    )
                  : (addressController.text.isEmpty
                      ? Row(
                          children: [
                            const Icon(
                              MaterialSymbols.wrong_location,
                              size: 24,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "No address provided",
                              style: TiffinAppTheme.bodySmallTextStyle
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                        )
                      : Text(
                          addressController.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ))
            ]),
          )),
    );
  }
}
