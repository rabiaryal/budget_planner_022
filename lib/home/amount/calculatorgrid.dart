import 'package:flutter/material.dart';

class CalculatorGrid extends StatelessWidget {
  final Function(String value) onButtonPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onCalculatePressed;

  const CalculatorGrid({
    required this.onButtonPressed,
    required this.onClearPressed,
    required this.onCalculatePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7',
      '8',
      '9',
      'C',
      '4',
      '5',
      '6',
      '*',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',
    ];

    // Define the scaling factor
    const double scaleFactor = 0.8;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate button size based on constraints
        final buttonSize = (constraints.maxWidth / 4 - 10.0) * scaleFactor;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0 * scaleFactor, // Scale spacing
            mainAxisSpacing: 10.0 * scaleFactor, // Scale spacing
          ),
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            final value = buttons[index];
            return SizedBox(
              height: buttonSize, // Scale button height
              width: buttonSize, // Scale button width
              child: ElevatedButton(
                onPressed: value == 'C'
                    ? onClearPressed
                    : value == '='
                        ? onCalculatePressed
                        : () => onButtonPressed(value),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10.0 * scaleFactor), // Scale padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Decreased radius
                  ),
                ),
                child: Text(
                  value,
                  style:
                      TextStyle(fontSize: 24 * scaleFactor), // Scale font size
                ),
              ),
            );
          },
        );
      },
    );
  }
}
