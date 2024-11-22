import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';

class BudgetTypeSelector extends StatelessWidget {
  final Function(String title, Color color) onBudgetTypeSelected;

  const BudgetTypeSelector({required this.onBudgetTypeSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBudgetTypeButton('Income', Colors.green,  context),
        _buildBudgetTypeButton('Expense', Colors.blue,context),
      ],
    );
  }

  Widget _buildBudgetTypeButton(String title, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () => onBudgetTypeSelected(title, color),
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStylesOO.title(context),
          ),
        ),
      ),
    );
  }
}

