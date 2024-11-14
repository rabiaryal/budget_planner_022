import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Planner"),

      ),
      body: Center(
        child: Column(
          children: [
           Container(
              height: 300,
              width: 300,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
