import 'package:budget_planner/home/widget/budgetbreakdown.dart';
import 'package:budget_planner/home/widget/initialbudget.dart';
import 'package:flutter/material.dart';
import 'package:budget_planner/Utils/components/round_button.dart';
// Import your DisplayAlertDialog class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void callTotalBudget() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FinalBudget()));
  }

  void callBudgetBreakdown() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const  BudgetBreakDown()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Planner"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundButton(
              title: "Add Your Total Budget",
              onPress: callTotalBudget,
              height: MediaQuery.of(context).size.height * 0.08,
              widht: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RoundButton(
              title: "Break Down Your Total Budget",
              onPress: callBudgetBreakdown,
              height: MediaQuery.of(context).size.height * 0.08,
              widht: MediaQuery.of(context).size.height * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
