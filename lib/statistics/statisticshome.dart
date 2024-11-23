import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:budget_planner/home/widget/pie_chart02.dart';

import 'package:flutter/material.dart';

class StatisticHomePage extends StatefulWidget {
  const StatisticHomePage({super.key});

  @override
  State<StatisticHomePage> createState() => _StatisticHomePageState();
}

class _StatisticHomePageState extends State<StatisticHomePage> {
  List data = [10, 30, 40, 50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content
          mainAxisSize: MainAxisSize.min, // Prevent Column from over-expanding
          children: [
            Text(
              'Statistics',
              style:
                  TextStylesOO.title(context), // Use a well-defined TextStyle
              maxLines: 1, // Prevent text overflow
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8), // Space between title and sidebar
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // Prevent Row from over-expanding
                children: const [
                  SidebarItem(label: 'Option 1'),
                  SidebarItem(label: 'Option 2'),
                  SidebarItem(label: 'Option 3'),
                  SidebarItem(label: 'Option 4'),
                  SidebarItem(label: 'Option 5'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [PieChartSample2()],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String label;

  const SidebarItem({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
