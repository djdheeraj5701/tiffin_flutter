// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ReceiptCard extends StatefulWidget {
  const ReceiptCard({super.key});

  @override
  State<ReceiptCard> createState() => _ReceiptCardState();
}

class _ReceiptCardState extends State<ReceiptCard> {
  final Map<String, double> invoiceSummaryItems = {
    "Subtotal": 199.00,
    "Packaging Charges": 0,
    "IGST Tax": 9.95,
    "Delivery Partner Fee": 0
  };
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(invoiceSummaryItems.length + 1, (index) {
                  String entryKey;
                  double entryValue;
                  if (index == invoiceSummaryItems.length) {
                    entryKey = "Grand Total";
                    entryValue = invoiceSummaryItems.values
                        .reduce((value, element) => value + element);
                  } else {
                    MapEntry entry =
                        invoiceSummaryItems.entries.elementAt(index);
                    entryKey = entry.key;
                    entryValue = entry.value;
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entryKey),
                      Text(entryValue == 0
                          ? "FREE"
                          : entryValue.toStringAsFixed(2))
                    ],
                  );
                }),
              ))),
    );
  }
}
