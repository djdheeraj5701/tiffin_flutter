// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class AddressCard extends StatefulWidget {
  AddressCard({super.key});
  late String primaryAddress;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isEditMode = false;
  List<String> addresses = [];

  @override
  void initState() {
    super.initState();
    widget.primaryAddress = addresses.isNotEmpty ? addresses.first : "";
  }

  openAddressDrawer() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(0).copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Text(
                            "Addresses",
                            style: TiffinAppTheme.headingSmallTextStyle,
                          ),
                        ),
                        ...List.generate(
                            addresses.length,
                            (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.primaryAddress = addresses[index];
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    elevation: 2,
                                    surfaceTintColor: widget.primaryAddress ==
                                            addresses[index]
                                        ? TiffinAppTheme.primaryTints[700]
                                        : Colors.white,
                                    shadowColor: Colors.grey.shade100,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(addresses[index]),
                                    ),
                                  ),
                                ))),
                        if (addresses.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Expanded(child: Divider()),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "OR",
                                  style: TiffinAppTheme.captionTextStyle,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Expanded(child: Divider()),
                              ],
                            ),
                          ),
                        Card(
                          elevation: 2,
                          surfaceTintColor: Colors.white,
                          shadowColor: Colors.grey.shade100,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 4,
                            keyboardType: TextInputType.streetAddress,
                            onFieldSubmitted: (address) {
                              setState(() {
                                addresses.add(address);
                                widget.primaryAddress = address;
                                Navigator.of(context).pop();
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: "Type your address here..."),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
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
                    onTap: openAddressDrawer,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: TiffinAppTheme.primaryColor),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          MaterialSymbols.edit_location_alt,
                          size: 24,
                          color: Colors.white,
                        )),
                  ),
                ),
              ]),
              (widget.primaryAddress.isEmpty
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
                      widget.primaryAddress,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ))
            ]),
          )),
    );
  }
}
