import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  Color? color;
  InfoWidget({super.key, required this.text, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color ?? GLobalVariables.baseColor,
        ),
        Text(
          text,
          style: TextStyle(color: GLobalVariables.baseColor, fontSize: 15.sp),
        ),
      ],
    );
  }
}
