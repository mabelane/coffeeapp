import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType(
      {super.key,
      required this.type,
      required this.cColor,
      required this.ontap});
  final String type;
  final Color cColor;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          type,
          style: TextStyle(fontSize: 18, color: cColor),
        ),
      ),
    );
  }
}
