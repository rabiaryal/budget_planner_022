import 'package:budget_planner/Utils/color/color.dart';
import 'package:budget_planner/Utils/components/boxbutton.dart';
import 'package:budget_planner/Utils/style/textstyle.dart';

import 'package:budget_planner/home/amount/amounthome.dart';
import 'package:budget_planner/home/display/dropdown.dart';
import 'package:budget_planner/home/display/maindisplay.dart';

import 'package:budget_planner/home/widget/pie_chart02.dart';
import 'package:budget_planner/profilepage/profilehomepage.dart';


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = [33.0, 25.0, 12.0, 24.0, 6.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.buttonColor,
          centerTitle: true,
          title: Text(
            "Budget Planner",
            style: TextStylesOO.button(context)
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingHomePage()));
              },
              icon: const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              BoxButtonWidget(
                  title: "Tap Me",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DisplayDataPage()));
                  }),
              Container(height: 200, child: MyFlutterDropdown()),
              const SizedBox(
                height: 400,
                width: double.infinity,
                child: PieChartSample2(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InitialInfoPage()),
            );
          },
          backgroundColor: AppColors.buttonColor,
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
            size: 70,
          ),
        ));
  }
}
