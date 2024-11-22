import 'package:budget_planner/home/homepage.dart';
import 'package:budget_planner/home/provider%20state/initialinfoprovider.dart';
import 'package:budget_planner/profilepage/notification/provider/notificationprovider.dart';
import 'package:budget_planner/provider/themeprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => InitialInfoProvider()),
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(create: (context)=>NotificationProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    return MaterialApp(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
      ),
      home: const HomePage(),
    );
  }
}
