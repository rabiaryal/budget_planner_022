import 'package:budget_planner/profilepage/setting/widget/darkmodewidget.dart';
import 'package:budget_planner/provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingHome extends StatefulWidget {
  const SettingHome({super.key});

  @override
  State<SettingHome> createState() => _SettingHomeState();
}

class _SettingHomeState extends State<SettingHome> {
  // Function to toggle dark mode
  void onChanged(BuildContext context, bool value) {
    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DarkModeWidget(
              isDarkMode: isDarkMode,
              onChanged: (value) => onChanged(context, value))
        ],
      ),
    );
  }
}
