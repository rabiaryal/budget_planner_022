import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/home/amount/amountinput.dart';
import 'package:budget_planner/home/amount/budgettypeselector.dart';
import 'package:budget_planner/home/amount/calculatorgrid.dart';
import 'package:budget_planner/home/amount/typescontainer.dart';
import 'package:budget_planner/home/storage/datamodels.dart';
import 'package:budget_planner/home/storage/financialdatamodel.dart';

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
  final manager = FinancialDataManager();

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
  if (title == "Expense") {
    // Ensure these values are unique and properly set
    return expenseItem;
  } else if (title == "Income") {
    // Ensure these values are unique and properly set
    return incomeItem;
  } else {
    return [];
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

  Future<void> _amountAdded() async {
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString(); // Unique key
  final expenseData = FinancialData(
    amountType: _titleString,
    expenseType: _selectController.text,  
    incomeType: _titleString == 'Income' ? _selectController.text : '',
    incomeAmount: _titleString == 'Income' ? double.tryParse(_amountController.text) ?? 0.0 : 0.0,
    expenseAmount: _titleString == 'Expense' ? double.tryParse(_amountController.text) ?? 0.0 : 0.0,
    remarks: _remarksController.text,
  );
  
  await manager.saveFinancialData('financial_data_$timestamp', expenseData);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Data saved successfully!')),
  );
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
