import 'package:budget_planner/Utils/color/color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final double height;
  final double widht;
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.height=40,
    this.widht= 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height:height,
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
                    style: const TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
