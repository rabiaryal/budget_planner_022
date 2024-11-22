import 'package:budget_planner/Utils/components/round_button.dart';
import 'package:budget_planner/setting/widget/listtilewidget.dart';
import 'package:budget_planner/setting/widget/uploadinfo.dart';
import 'package:flutter/material.dart';
// Make sure to import your `ListTileWidget` file

class SettingHomePage extends StatefulWidget {
  const SettingHomePage({super.key});

  @override
  State<SettingHomePage> createState() => _SettingHomePageState();
}

class _SettingHomePageState extends State<SettingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle menu actions
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              // Profile Section
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Tianan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Pro User",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // List Tiles Section
              ListTileWidget(
                leadingIcon: Icons.add_circle_outline,
                titleText: "Upload Info",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadInfoWidget()));
                  // Handle FAQ action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.settings,
                titleText: "Settings",
                onPressed: () {
                  // Handle settings action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.privacy_tip,
                titleText: "Privacy Policy",
                onPressed: () {
                  // Handle privacy policy action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.lock_outline,
                titleText: "Password",
                onPressed: () {
                  // Handle password action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.switch_account,
                titleText: "Switch Accounts",
                onPressed: () {
                  // Handle switch accounts action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.notifications_outlined,
                titleText: "Notification",
                onPressed: () {
                  // Handle notifications action
                },
              ),
              ListTileWidget(
                leadingIcon: Icons.bar_chart,
                titleText: "Reports Settings",
                onPressed: () {
                  // Handle reports settings action
                },
              ),
              const SizedBox(height: 30),

              RoundButton(
                  title: "Logout",
                  widht: double.infinity,
                  height: 70,
                  buttonColor: Colors.pink,
                  onPress: () {}),
              // Logout Button

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
