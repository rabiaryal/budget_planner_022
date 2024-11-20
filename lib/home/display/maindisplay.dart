import 'package:budget_planner/home/storage/datamodels.dart';
import 'package:flutter/material.dart';
import 'package:budget_planner/home/storage/financialdatamodel.dart';

class DisplayDataPage extends StatefulWidget {
  const DisplayDataPage({Key? key}) : super(key: key);

  @override
  State<DisplayDataPage> createState() => _DisplayDataPageState();
}

class _DisplayDataPageState extends State<DisplayDataPage> {
  final manager = FinancialDataManager();
  List<FinancialData> financialDataList = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // Load saved data on initialization
  }

  Future<void> _loadData() async {
    final data = await manager.getAllFinancialData(); // Assuming this method retrieves all saved data
    setState(() {
      financialDataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Financial Data'),
      ),
      body: financialDataList.isEmpty
          ? const Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: financialDataList.length,
              itemBuilder: (context, index) {
                final data = financialDataList[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(data.amountType),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expense Type: ${data.expenseType ?? 'N/A'}'),
                        Text('Income Type: ${data.incomeType ?? 'N/A'}'),
                        Text(
                            'Amount: ${(data.amountType == "Income" ? data.incomeAmount : data.expenseAmount).toString()}'),
                        Text('Remarks: ${data.remarks}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
