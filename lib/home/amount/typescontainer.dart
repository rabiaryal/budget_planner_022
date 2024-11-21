 // Use the merged provider
import 'package:budget_planner/home/provider%20state/initialinfoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_planner/Utils/style/textstyle.dart';

class IOTypes extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool readOnly;
  final List<String> options;

  const IOTypes({
    required this.controller,
    required this.labelText,
    required this.options,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity, // Ensures the container takes up the full width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.yellow, width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelText,
              style: TextStylesOO.label,
            ),
            Consumer<InitialInfoProvider>( // Use the merged provider
              builder: (context, provider, child) {
                return DropdownButton<String>(
                  value: provider.selectedValue, // Use the selected value from the provider
                  hint: const Text(
                    'Select Option',
                    style: TextStylesOO.input,
                    textAlign: TextAlign.right,
                  ),
                  isExpanded: true,
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Card(
                        color: Colors.lightBlue[200],
                        elevation: 2,
                        child: SizedBox(
                          width: double.infinity, // Sets the width
                          height: 50, // Sets the height of the card
                          child: Center(
                            child: Text(
                              option,
                              style: TextStylesOO.input,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: readOnly
                      ? null
                      : (String? newValue) {
                          // Update the provider's selected value when a new option is selected
                          provider.setSelectedValue(newValue);
                          controller.text = newValue ?? ''; // Update the controller
                        },
                  dropdownColor: Colors.transparent,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
