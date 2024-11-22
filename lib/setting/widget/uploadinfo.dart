import 'package:budget_planner/home/widget/textformfield.dart';
import 'package:flutter/material.dart';

class UploadInfoWidget extends StatelessWidget {
  UploadInfoWidget({super.key});

  final TextEditingController _controller01 = TextEditingController();
  final TextEditingController _controller02 = TextEditingController();

  final TextEditingController _controller03 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.green,
              ),
              BuildTextFormField(
                  controller: _controller01,
                   labelText: "First Name"),
            const  SizedBox(
                height: 10,
              ),
        BuildTextFormField(
                  controller: _controller02,
                   labelText: "Last Name"),
           const   SizedBox(
                height: 10,
              ),
              BuildTextFormField(controller: _controller03, 
              labelText: "Age"),
           const   SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
