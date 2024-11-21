import 'package:budget_planner/home/provider%20state/initialinfoprovider.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:provider/provider.dart';
import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/home/amount/amountinput.dart';
import 'package:budget_planner/home/amount/budgettypeselector.dart';
import 'package:budget_planner/home/amount/calculatorgrid.dart';
import 'package:budget_planner/home/amount/typescontainer.dart';
import 'package:budget_planner/home/storage/datamodels.dart';
import 'package:budget_planner/home/storage/financialdatamodel.dart';
 // Import the provider class

class InitialInfoPage extends StatelessWidget {
  const InitialInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InitialInfoProvider>(context);

    return Scaffold(
      backgroundColor: provider.backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                BudgetTypeSelector(
                  onBudgetTypeSelected: (title, color) {
                    provider.updateBudgetType(title, color);
                  },
                ),
                const SizedBox(height: 20),
                IOTypes(
                  controller: provider.selectController,
                  labelText: "Select an ${provider.titleString} Option",
                  options: provider.decideOption(provider.titleString),
                ),
                const SizedBox(height: 10),
                AmountInput(
                  controller: provider.amountController,
                  labelText: 'Enter ${provider.titleString} Amount',
                  readOnly: true,
                ),
                const SizedBox(height: 10),
                AmountInput(
                  controller: provider.remarksController,
                  labelText: 'Remarks',
                  readOnly: false,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: CalculatorGrid(
                    onButtonPressed: (value) {
                      provider.amountController.text += value;
                    },
                    onClearPressed: provider.clearInputs,
                    onCalculatePressed: () {
                      try {
                        final input = provider.amountController.text;
                        final result = input.interpret();
                        provider.amountController.text = result.toString();
                      } catch (_) {
                        provider.amountController.text = 'Error';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                RoundButton(
                  title: "Add ${provider.titleString}",
                  onPress: () async {
                    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
                    final expenseData = FinancialData(
                      amountType: provider.titleString,
                      expenseType: provider.selectController.text,
                      incomeType: provider.titleString == 'Income' ? provider.selectController.text : '',
                      incomeAmount: provider.titleString == 'Income'
                          ? double.tryParse(provider.amountController.text) ?? 0.0
                          : 0.0,
                      expenseAmount: provider.titleString == 'Expense'
                          ? double.tryParse(provider.amountController.text) ?? 0.0
                          : 0.0,
                      remarks: provider.remarksController.text,
                    );

                    // Save data using your existing manager
                    await FinancialDataManager().saveFinancialData(
                      'financial_data_$timestamp',
                      expenseData,
                    );

                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data saved successfully!')),
                    );

                    // Clear inputs after saving
                    provider.clearInputs();
                  },
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
