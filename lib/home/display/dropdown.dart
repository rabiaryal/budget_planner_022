import 'package:flutter/material.dart';

class MyFlutterDropdown extends StatefulWidget {
  @override
  _MyFlutterDropdownState createState() => _MyFlutterDropdownState();
}

class _MyFlutterDropdownState extends State<MyFlutterDropdown> {
  final List<String> items = ["Pi Chart", "Bar Graph", "Line Chart"];
  String? selectedOption; // Variable to store the selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Dropdown Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DropdownButton<String>(
          value: selectedOption, // Display the selected option
          hint: const Text("Select Option"), // Placeholder text
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue; // Update the selected value
            });
            print(newValue); // Optionally, log the selected value
          },
        ),
      ),
    );
  }
}
