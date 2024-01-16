import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: TiffinAppTheme.primaryTints[100],
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tiffins.length,
                  itemBuilder: (context, index) {
                    return TiffinCard(tiffin: tiffins[index]);
                  }),
            ],
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
