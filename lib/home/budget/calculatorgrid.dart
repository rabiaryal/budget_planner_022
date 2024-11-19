import 'package:flutter/material.dart';

class CalculatorGrid extends StatelessWidget {
  final Function(String value) onButtonPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onCalculatePressed;

  const CalculatorGrid({
    required this.onButtonPressed,
    required this.onClearPressed,
    required this.onCalculatePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7', '8', '9', 'C',
      '4', '5', '6', '*',
      '1', '2', '3', '-',
      '0', '.', '=', '+',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final value = buttons[index];
        return ElevatedButton(
          onPressed: value == 'C'
              ? onClearPressed
              : value == '='
                  ? onCalculatePressed
                  : () => onButtonPressed(value),
          child: Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }
}
