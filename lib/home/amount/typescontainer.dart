import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class IOTypes extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool readOnly;
  final List<String> options; // Options for the dropdown

  const IOTypes({
    required this.controller,
    required this.labelText,
    required this.options,
    this.readOnly = false,
    super.key,
  });

  @override
  State<IOTypes> createState() => _IOTypesState();
}

class _IOTypesState extends State<IOTypes> {
  String? _selectedValue;

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
              widget.labelText,
              style: TextStylesOO.label,
            ),
            DropdownButton<String>(
                value: _selectedValue,
                hint: const Text(
                  'Select Option',
                  style: TextStylesOO.input,
                  textAlign: TextAlign.right,
                ),
                isExpanded: true,
                items: widget.options.map((String option) {
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
                onChanged: widget.readOnly
                    ? null
                    : (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                          widget.controller.text =
                              newValue ?? ''; // Update the controller
                        });
                      },
                dropdownColor: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
