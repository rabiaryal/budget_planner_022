import 'package:budget_planner/Utils/color/color.dart';
import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final double height;
  final double widht;
  final Color buttonColor;
  final TextStyle? myStyle;
 const   RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.height = 40,
    this.widht = 200,
    this.buttonColor = AppColors.buttonColor,
    this.myStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: widht,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: myStyle??TextStylesOO.button(context)
                  )),
      ),
    );
  }
}
