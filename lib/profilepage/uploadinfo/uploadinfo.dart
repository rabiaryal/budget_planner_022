import 'package:budget_planner/Utils/color/color.dart';
import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:budget_planner/profilepage/uploadinfo/widget/dobwidget.dart';
import 'package:budget_planner/profilepage/uploadinfo/widget/textwidget.dart';

import 'package:flutter/material.dart';

class UploadInfoWidget extends StatelessWidget {
  UploadInfoWidget({super.key});

  final TextEditingController _controller01 = TextEditingController();
  final TextEditingController _controller02 = TextEditingController();

  final TextEditingController _controller03 = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  // Navigate back
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              // Title
              Center(
                child: Text(
                  "Get Register",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Input Fields
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const TextWidget(text: 'Enter Full Name'),
                    const SizedBox(height: 8),
                    // Full Name
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Bijay Raj Pokherel",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    DateOfBirthSelector(dobController: dobController),
                    const SizedBox(height: 10),
                    const TextWidget(text: 'Enter Email '),
                    const SizedBox(height: 8),
                    // Email
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "bijay@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextWidget(text: 'Enter UserName'),
                    const SizedBox(height: 8),
                    // Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "UserName",
                        hintText: "@bijayraj",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextWidget(text: 'Phone Number'),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "980000000",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Terms and Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {
                            // Handle checkbox toggle
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: "I agree to the processing of ",
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Personal data",
                                style: TextStyle(color: Colors.blue.shade700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Sign Up Button
                    RoundButton(
                        height: 70,
                        title: 'Register',
                        onPress: () {},
                        buttonColor: AppColors.buttonColor01,
                        myStyle: TextStylesOO.button),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
