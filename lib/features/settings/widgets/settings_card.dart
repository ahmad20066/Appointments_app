import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  bool fill;
  SettingsCard(
      {super.key,
      required this.title,
      required this.icon,
      this.fill = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: fill ? GLobalVariables.baseColor : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Icon(
              icon,
              size: 45.sp,
              color: fill ? Colors.white : GLobalVariables.baseColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: fill ? Colors.white : GLobalVariables.baseColor),
            )
          ],
        ),
      ),
    );
  }
}
