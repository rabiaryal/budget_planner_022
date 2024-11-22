import 'package:budget_planner/profilepage/notification/provider/notificationprovider.dart';
import 'package:budget_planner/profilepage/notification/widget/notifywidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationPAge extends StatelessWidget {
  const NotificationPAge({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(FontAwesomeIcons.bell),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotifyWidget(
            text: "Email Notifications",
            leadingIcon: Icons.email,
            switchValue: provider.isEmailSwitched,
            onSwitchChanged: provider.onEmailSwitchChanged,
          ),
          SizedBox(
            height: 20,
          ),
          NotifyWidget(
            text: "Sound and Vibrations",
            leadingIcon: Icons.vibration,
            switchValue: provider.isSoundSwitched,
            onSwitchChanged: provider.onSoundSwitchChanged,
          ),
          SizedBox(
            height: 20,
          ),
          NotifyWidget(
            text: "Push Notification",
            leadingIcon: Icons.comment,
            switchValue: provider.isPushSwitched,
            onSwitchChanged: provider.onPushSwitchChanged,
          ),
        ],
      ),
    );
  }
}
