import 'package:flutter/material.dart';

class UploadInfoWidget extends StatelessWidget {
  const UploadInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.green,
          ),
        ],
      ),
    ));
  }
}
