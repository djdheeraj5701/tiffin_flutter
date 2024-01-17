// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:tiffin_flutter/app/shared/dialogs/home_tiffin_filter.dart';
import 'package:tiffin_flutter/app/shared/enums/food_type.dart';
import 'package:tiffin_flutter/app/shared/models/tiffin_dto.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_card.dart';
import 'package:tiffin_flutter/app/navbar/tiffin_app_navbar.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  redirectToNotificationsPage() {}

  searchTiffins(String searchValue) {
    print(searchValue);
  }

  openFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HomeTiffinFilterDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: TiffinAppTheme.primaryTints[100],
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tiffins for\nYou",
                        style: TiffinAppTheme.headingLargeTextStyle,
                      ),
                      GestureDetector(
                        onTap: redirectToNotificationsPage,
                        child: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              MaterialSymbols.notifications_filled,
                              size: 24,
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: searchTiffins,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(MaterialSymbols.search),
                          hintText: "Search",
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TiffinAppTheme.bodyRegularTextStyle,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z 0-9]'))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: openFilterDialog,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: TiffinAppTheme.primaryColor),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              MaterialSymbols.tune,
                              size: 24,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tiffins.length,
                    itemBuilder: (context, index) {
                      return TiffinCard(tiffin: tiffins[index]);
                    }),
              ],
            ),
          )),
      bottomNavigationBar: const TiffinAppNavbar(),
    ));
  }
}

var tiffins = [
  TiffinDTO(
      imageUrl:
          "https://t4.ftcdn.net/jpg/02/75/39/13/360_F_275391367_Hro3Ql1iFsCNtd86zWYuqa0Qe5cc7goE.jpg",
      title: "Jumbo Tiffin",
      description: "2 types of sabji, 3 chapati, rice, dessert, papad",
      price: 100,
      foodType: "Veg"),
  TiffinDTO(
      imageUrl:
          "https://t4.ftcdn.net/jpg/02/75/39/13/360_F_275391367_Hro3Ql1iFsCNtd86zWYuqa0Qe5cc7goE.jpg",
      title: "Jumbo Tiffin",
      description: "2 types of sabji, 3 chapati, rice, dessert, papad",
      price: 99,
      foodType: "Non-Veg"),
  TiffinDTO(
      imageUrl:
          "https://t4.ftcdn.net/jpg/02/75/39/13/360_F_275391367_Hro3Ql1iFsCNtd86zWYuqa0Qe5cc7goE.jpg",
      title: "Jumbo Tiffin",
      description: "2 types of sabji, 3 chapati, rice, dessert, papad",
      price: 179,
      foodType: "Egg"),
];
