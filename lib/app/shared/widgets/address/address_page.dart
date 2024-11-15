import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_app_bar.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<String> addresses = ["Vimannagar", "Magarpatta", "Kalyani"];

  final TextStyle _manageButtonTextStyle = TiffinAppTheme.buttonTextStyle
      .copyWith(
          fontWeight: FontWeight.bold, color: TiffinAppTheme.primaryColor);

  void openBottomDrawer({required String type, int? index, String? address}) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(0).copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 36),
                    child: Card(
                      elevation: 2,
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.grey.shade100,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        initialValue: address,
                        minLines: 2,
                        maxLines: 4,
                        keyboardType: TextInputType.streetAddress,
                        onFieldSubmitted: (newAddress) {
                          setState(() {
                            if (newAddress.isNotEmpty) {
                              if (type == "UPDATE") {
                                addresses[index!] = newAddress;
                              } else if (type == "ADD") {
                                addresses.add(newAddress);
                              }
                            }
                            Navigator.of(context).pop();
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Type your address here..."),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TiffinAppBar(context, "Manage Address"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: addresses.isEmpty
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
            : SingleChildScrollView(
                child: Column(
                children: addresses.indexed.map((entry) {
                  int index = entry.$1;
                  String address = entry.$2;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address,
                        style: TiffinAppTheme.bodyRegularTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        spacing: 24,
                        children: [
                          GestureDetector(
                              onTap: () {
                                openBottomDrawer(
                                    type: "UPDATE",
                                    index: index,
                                    address: address);
                              },
                              child: Text(
                                "Edit",
                                style: _manageButtonTextStyle,
                              )),
                          if (index != 0)
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    addresses.removeAt(index);
                                  });
                                },
                                child: Text(
                                  "Delete",
                                  style: _manageButtonTextStyle,
                                )),
                          if (index != 0)
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    addresses.removeAt(index);
                                    addresses.insert(0, address);
                                  });
                                },
                                child: Text(
                                  "Set as Primary",
                                  style: _manageButtonTextStyle,
                                )),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  );
                }).toList(),
              )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: ElevatedButton(
          onPressed: () {
            openBottomDrawer(type: "ADD");
          },
          child: const Text("Add New Address"),
        ),
      ),
    ));
  }
}
