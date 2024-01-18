import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/models/tiffin_dto.dart';
import 'package:tiffin_flutter/app/shared/widgets/tiffin_card.dart';

class TiffinOrderPage extends StatefulWidget {
  const TiffinOrderPage({super.key});

  @override
  State<TiffinOrderPage> createState() => _TiffinOrderPageState();
}

class _TiffinOrderPageState extends State<TiffinOrderPage> {
  @override
  Widget build(BuildContext context) {
    final TiffinDTO tiffinDTO =
        ModalRoute.of(context)?.settings.arguments as TiffinDTO;
    return SafeArea(
      child: Scaffold(
        body: TiffinCard(
          tiffin: tiffinDTO,
        ),
      ),
    );
  }
}
