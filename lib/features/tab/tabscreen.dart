import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/home/screens/home_screen.dart';
import 'package:appointments/features/profile/screens/expert_profile_screen.dart';
import 'package:appointments/features/settings/screens/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentindex = 1;

  List<IconData> items = [Icons.person, Icons.home, Icons.settings];
  List<Widget> screens = [
    ExpertProfileScreen(),
    HomeScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentindex,
        height: 50.h,
        color: GLobalVariables.baseColor,
        backgroundColor: Colors.white,
        items: items
            .map((e) => Icon(
                  e,
                  size: 30.sp,
                  color: Colors.white,
                ))
            .toList(),
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
      ),
      body: screens[currentindex],
    );
  }
}
