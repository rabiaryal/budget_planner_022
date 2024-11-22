import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:budget_planner/home/provider%20state/initialinfoprovider.dart'; // Updated provider import

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
    // Use Consumer to listen for changes in the InitialInfoProvider
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
              style: TextStylesOO.label(context)
            ),
            Consumer<InitialInfoProvider>(
              // Use Consumer to listen for state changes
              builder: (context, provider, child) {
                return DropdownButton<String>(
                  value: provider.selectedOption.isNotEmpty &&
                          options.contains(provider.selectedOption)
                      ? provider.selectedOption
                      : null, // Default to null if no match
                  hint: Text(
                    'Select Option',
                    style: TextStylesOO.input(context),
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
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              option,
                              style: TextStylesOO.input(context)
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: readOnly
                      ? null
                      : (String? newValue) {
                          if (newValue != null) {
                            provider.updateSelectedOption(newValue);
                            controller.text = newValue; // Update the controller
                          }
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
