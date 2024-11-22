import 'package:flutter/material.dart';

class DarkModeWidget extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const DarkModeWidget({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      leading: Icon(
        isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      title: Text(
        'Dark Mode',
        style: TextStyle(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Switch(
        value: isDarkMode,
        onChanged: onChanged,
        activeColor: Colors.pink, // Custom color for active state
      ),
      tileColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}
