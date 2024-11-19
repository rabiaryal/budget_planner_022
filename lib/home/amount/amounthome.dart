import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/home/amount/amountinput.dart';
import 'package:budget_planner/home/amount/budgettypeselector.dart';
import 'package:budget_planner/home/amount/calculatorgrid.dart';
import 'package:budget_planner/home/amount/typescontainer.dart';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class InitialInfoPage extends StatefulWidget {
  const InitialInfoPage({super.key});

  @override
  State<InitialInfoPage> createState() => _InitialInfoPageState();
}

class _InitialInfoPageState extends State<InitialInfoPage> {
  Color _backgroundColor = Colors.blue;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _selectController = TextEditingController();
  String _titleString = '';

  final List<String> expenseItem = [
    "Essential",
    "Non-Essential",
    "Finicial Obligations",
    'Saving And Investment'
  ];

  final List<String> incomeItem = [
    "Active Income",
    'INvestment Income',
    'Passive Income',
    'Government and Social Support'
  ];

  void _updateBudgetType(String title, Color color) {
    setState(() {
      _backgroundColor = color;
      _titleString = title;
      decideOption(title);
      _clearInput();
    });
  }

  List<String> decideOption(String title) {
    if (_titleString == title) {
      return expenseItem;
    } else {
      return incomeItem;
    }
  }

  void _onButtonPressed(String value) {
    setState(() {
      _amountController.text += value;
    });
  }

  void _calculateResult() {
    try {
      final input = _amountController.text;
      final result = input.interpret();
      setState(() {
        _amountController.text = result.toString();
      });
    } catch (_) {
      setState(() {
        _amountController.text = 'Error';
      });
    }
  }

  void _clearInput() {
    _amountController.clear();
    _remarksController.clear();
  }

  void _amountAdded() {
    // Logic for adding the amount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor ?? Colors.blue,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                BudgetTypeSelector(
                  onBudgetTypeSelected: _updateBudgetType,
                ),
                const SizedBox(height: 20),
                IOTypes(
                  controller: _selectController,
                  labelText: "Select an $_titleString Option",
                  options: decideOption(_titleString),
                ),
                const SizedBox(
                  height: 10,
                ),
                AmountInput(
                  controller: _amountController,
                  labelText: 'Enter $_titleString Amount',
                  readOnly: true,
                ),
                const SizedBox(height: 10),
                AmountInput(
                  controller: _remarksController,
                  labelText: 'Remarks',
                  readOnly: false,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: CalculatorGrid(
                    onButtonPressed: _onButtonPressed,
                    onClearPressed: _clearInput,
                    onCalculatePressed: _calculateResult,
                  ),
                ),
                const SizedBox(height: 10),
                RoundButton(
                  title: "Add $_titleString",
                  onPress: _amountAdded,
                  height: 60,
                  widht: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
