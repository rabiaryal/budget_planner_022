import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/home/widget/textformfield.dart';
import 'package:flutter/material.dart';

class BudgetBreakDown extends StatefulWidget {
  const BudgetBreakDown({super.key});

  @override
  State<BudgetBreakDown> createState() => _BudgetBreakDownState();
}

class _BudgetBreakDownState extends State<BudgetBreakDown> {
  final List<TextEditingController> _controllers = [];
  final List<String> _labels = [
    "Enter your budget",
    "Enter your budget for food",
    "Enter your budget for travel",
    "Enter your budget for leisure",
    "Enter your budget",
    "Enter your budget for food",
    "Enter your budget for travel",
    "Enter your budget for leisure"
  ];

  @override
  void initState() {
    super.initState();
    // Initialize controllers dynamically based on labels
    for (int i = 0; i < _labels.length; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: RichText(
                  text: const TextSpan(
                    text: 'Total Budget, ',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'RS 50000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RoundButton(
                title: "Add the Area of Interest",
                onPress: () {
                  setState(() {
                    // Increment only if there are more fields to show
                    if (_controllers.length < _labels.length) {
                      _controllers.add(TextEditingController());
                    }
                  });
                },
              ),
              const SizedBox(height: 16),

              // Display the text fields inside Dismissible widgets
              Expanded(
                child: ListView.builder(
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          // Remove the corresponding controller and label
                          _controllers.removeAt(index);
                        });
                      },
                      child: Column(
                        children: [
                          BuildTextFormField(
                            controller: _controllers[index],
                            labelText: _labels[index],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers when the widget is disposed
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
