import 'package:flutter/material.dart';

class DateOfBirthSelector extends StatelessWidget {
  final TextEditingController dobController;

  const DateOfBirthSelector({super.key, required this.dobController});

  // Function to show the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default starting date
      firstDate: DateTime(1900),  // Earliest selectable date
      lastDate: DateTime.now(),  // Latest selectable date
    );

    if (selectedDate != null) {
      // Format the date and set it in the TextEditingController
      dobController.text =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of Birth",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: dobController,
          readOnly: true, // Disable direct editing
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Select your date of birth",
            suffixIcon: Icon(Icons.calendar_today), // Calendar icon
          ),
          onTap: () => _selectDate(context), // Show date picker on tap
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select your date of birth";
            }
            return null;
          },
        ),
      ],
    );
  }
}
