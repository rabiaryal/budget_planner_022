import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool readOnly;

  const AmountInput({
    required this.controller,
    required this.labelText,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.yellow, width: 2.0),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        style: TextStylesOO.input(context),
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStylesOO.label(context),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
