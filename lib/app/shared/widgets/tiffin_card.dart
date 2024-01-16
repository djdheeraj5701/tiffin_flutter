// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TiffinCard extends StatelessWidget {
  const TiffinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image(
                  image: NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/75/39/13/360_F_275391367_Hro3Ql1iFsCNtd86zWYuqa0Qe5cc7goE.jpg"),
                  width: double.infinity,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text("Hello world")
          ])),
    );
  }
}
