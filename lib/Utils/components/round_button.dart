import 'package:budget_planner/Utils/color/color.dart';
import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final double height;
  final double widht;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.height = 40,
    this.widht = 200,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: widht,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStylesOO.button,
                  )),
      ),
    );
  }
}
