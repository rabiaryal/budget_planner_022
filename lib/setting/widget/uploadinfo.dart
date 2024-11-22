import 'package:budget_planner/Utils/color/color.dart';
import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/Utils/style/textstyle.dart';
import 'package:budget_planner/home/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadInfoWidget extends StatelessWidget {
  UploadInfoWidget({super.key});

  final TextEditingController _controller01 = TextEditingController();
  final TextEditingController _controller02 = TextEditingController();

  final TextEditingController _controller03 = TextEditingController();

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
                    // Full Name
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Enter Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "UserName",
                        hintText: "Enter UserName",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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

                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // Handle sign up
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.blue,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       padding: const EdgeInsets.symmetric(vertical: 15),
                    //     ),
                    //     child: const Text(
                    //       "Register",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // const SizedBox(height: 20),
                    // // Social Media Login
                    // Row(
                    //   children: [
                    //     const Expanded(child: Divider(color: Colors.grey)),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text(
                    //         "OR Register With ...",
                    //         style: TextStyle(color: Colors.grey.shade700),
                    //       ),
                    //     ),
                    //     const Expanded(child: Divider(color: Colors.grey)),
                    //   ],
                    // ),
                    // const SizedBox(height: 15),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     IconButton(
                    //       icon: const Icon(Icons.facebook,
                    //           color: Colors.deepPurpleAccent),
                    //       onPressed: () {
                    //         // Handle Facebook login
                    //       },
                    //     ),
                    //     IconButton(
                    //       icon: const Icon(FontAwesomeIcons.twitter,
                    //           color: Colors.deepPurpleAccent),
                    //       color: Colors.lightBlue,
                    //       onPressed: () {
                    //         // Handle Twitter login
                    //       },
                    //     ),
                    //     IconButton(
                    //       icon: const Icon(FontAwesomeIcons.google,
                    //           color: Colors.deepPurpleAccent),
                    //       onPressed: () {
                    //         // Handle Google login
                    //       },
                    //     ),
                    //     IconButton(
                    //       icon: const Icon(Icons.apple,
                    //           color: Colors.deepPurpleAccent),
                    //       onPressed: () {
                    //         // Handle Apple login
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // // Already have an account
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text("Account Already Register? "),
                    //     GestureDetector(
                    //       onTap: () {
                    //         // Navigate to sign in
                    //       },
                    //       child: Text(
                    //         "Sign up",
                    //         style: TextStyle(color: Colors.blue.shade700),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
