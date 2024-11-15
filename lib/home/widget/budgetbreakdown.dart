import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class BudgetBreakDown extends StatefulWidget {
  const BudgetBreakDown({super.key});

  @override
  State<BudgetBreakDown> createState() => _BudgetBreakDownState();
}

class _BudgetBreakDownState extends State<BudgetBreakDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(
      height: 50, // Set a specific height for the Marquee
      child: RichText(text: 
       const  TextSpan(
    text: 'Total Budget, ',
    style: TextStyle(fontSize: 24, color: Colors.black),
    children: <TextSpan>[
      TextSpan(
        text: 'RS 50000',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    ],
  ),
      
      )
    ),
            ],
          ),
        ),
      ),
    );
  }
}
