import 'package:flutter/foundation.dart';

class FinancialData {
  final String amountType; // e.g., "Income" or "Expense"
  final String expenseType; // e.g., "Food", "Transport", "Entertainment"
  final String incomeType; // e.g., "Salary", "Investment", "Other"
  final double incomeAmount; // Amount for income
  final double expenseAmount; // Amount for expenses
  final String remarks; // Remarks for either income or expenses

  FinancialData({
    required this.amountType,
    this.expenseType = '',
    this.incomeType = '',
    this.incomeAmount = 0.0,
    this.expenseAmount = 0.0,
    this.remarks = '',
  });

  // Factory method to create a FinancialData object from JSON
  factory FinancialData.fromJson(Map<String, dynamic> json) {
    return FinancialData(
      amountType: json['amountType'],
      expenseType: json['expenseType'] ?? '',
      incomeType: json['incomeType'] ?? '',
      incomeAmount: (json['incomeAmount'] ?? 0.0) as double,
      expenseAmount: (json['expenseAmount'] ?? 0.0) as double,
      remarks: json['remarks'] ?? '',
    );
  }

  // Convert a FinancialData object to JSON
  Map<String, dynamic> toJson() {
    return {
      'amountType': amountType,
      'expenseType': expenseType,
      'incomeType': incomeType,
      'incomeAmount': incomeAmount,
      'expenseAmount': expenseAmount,
      'remarks': remarks,
    };
  }

  // Method for debugging purposes
  @override
  String toString() {
    return 'FinancialData(amountType: $amountType, expenseType: $expenseType, incomeType: $incomeType, incomeAmount: $incomeAmount, expenseAmount: $expenseAmount, remarks: $remarks)';
  }
}
