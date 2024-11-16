import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:flutter/material.dart';

class FinalBudget extends StatefulWidget {
  const FinalBudget({super.key});

  @override
  State<FinalBudget> createState() => _FinalBudgetState();
}

class _FinalBudgetState extends State<FinalBudget> {
  final TextEditingController _budgetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildBudgetInput() {
    return TextFormField(
      controller: _budgetController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        labelText: "Enter your total Budget",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid budget';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a numeric value';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildBudgetInput(),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      title: "Save ",
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          // Save logic, possibly with setState or external state management
                          Navigator.pop(context);
                        }
                      },
                      widht: MediaQuery.of(context).size.width * 0.4,
                    ),
                    
                    RoundButton(
                      title: "Cancel",
                      onPress: () {
                        Navigator.pop(context);
                      },
                      widht: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
