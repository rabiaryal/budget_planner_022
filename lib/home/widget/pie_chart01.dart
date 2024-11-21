import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartDisplay extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;
  final String title;

  const PieChartDisplay({
    Key? key,
    required this.values,
    required this.colors,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStylesOO.title),
            const SizedBox(height: 20),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: _generateSections(),
                  sectionsSpace: 3,
                  centerSpaceRadius: 65,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Generate sections for the pie chart
  List<PieChartSectionData> _generateSections() {
    return values.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;

      return PieChartSectionData(
        value: value,
        title: '${value.toStringAsFixed(1)}%',
        color: colors[index],
        titleStyle: TextStylesOO.input,
        radius: 80,
      );
    }).toList();
  }
}
