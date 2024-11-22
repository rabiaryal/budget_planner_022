import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String titleText;
  final VoidCallback onPressed;

  const ListTileWidget({
    super.key,
    required this.leadingIcon,
    required this.titleText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(leadingIcon, color: Colors.pink),
      ),
      title: Text(
        titleText,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onPressed,
    );
  }
}
