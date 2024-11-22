import 'package:flutter/material.dart';

class NotifyWidget extends StatelessWidget {

  final String text;
  final IconData leadingIcon;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;
  const NotifyWidget({super.key,
  required this.text,
  required this.leadingIcon,
  required this.switchValue,
  required this.onSwitchChanged,
  
  });

  @override
  Widget build(BuildContext context) {
       return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(leadingIcon), // Leading icon
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        trailing: Switch(
          value: switchValue,  // The current value of the switch
          onChanged: onSwitchChanged,  // Function to call when the switch value changes
          activeColor: Colors.pink,  // Custom active color for the switch
        ),
      ),
    );
  }
}
