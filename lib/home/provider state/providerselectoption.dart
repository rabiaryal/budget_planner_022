import 'package:flutter/material.dart';

class SelectionOptionProvider extends ChangeNotifier{

 String? _selectedValue;

  String? get selectedValue => _selectedValue;

  // Set the selected value and notify listeners
  void setSelectedValue(String? newValue) {
    _selectedValue = newValue;
    notifyListeners();  // Notify listeners when the selected value changes
  }

}