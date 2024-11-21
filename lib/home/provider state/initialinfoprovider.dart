import 'package:flutter/material.dart';

class InitialInfoProvider extends ChangeNotifier {
  // Fields for InitialInfoProvider
  Color _backgroundColor = Colors.blue;
  String _titleString = '';
  String _selectedOption = '';
  final TextEditingController amountController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController selectController = TextEditingController();

  // New field from SelectionOptionProvider
  String? _selectedValue;

  // Getters
  Color get backgroundColor => _backgroundColor;
  String get titleString => _titleString;
  String get selectedOption => _selectedOption;
  String? get selectedValue => _selectedValue;

  // Setters and business logic
  void updateBudgetType(String title, Color color) {
    _backgroundColor = color;
    _titleString = title;
    _selectedOption = '';
    notifyListeners();
  }

  List<String> decideOption(String title) {
    if (title == "Expense") {
      return ["Essential", "Non-Essential", "Financial Obligations", "Saving And Investment"];
    } else if (title == "Income") {
      return ["Active Income", "Investment Income", "Passive Income", "Government and Social Support"];
    } else {
      return [];
    }
  }

  void updateSelectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }

  // New method from SelectionOptionProvider
  void setSelectedValue(String? newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }

  void clearInputs() {
    amountController.clear();
    remarksController.clear();
  }

  // Simulate saving data (you can integrate with your actual database or storage logic)
  Future<void> saveData() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString(); // Unique key
    // Simulate the save functionality with the gathered data
    // Your logic to save the data
    print('Data saved with timestamp $timestamp');
    notifyListeners();
  }
}
