import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTag extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const CategoryTag(
      {Key? key,
      this.isSelected = false,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? GLobalVariables.baseColor : Colors.white,
            border: Border.all(
                color: isSelected ? Colors.white : GLobalVariables.baseColor)),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.white : GLobalVariables.baseColor),
        ),
      ),
    );
  }
}
