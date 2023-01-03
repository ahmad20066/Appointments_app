import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiddleText extends StatelessWidget {
  String text;
  MiddleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.8, 1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18.h),
        child: Text(
          text,
          style: TextStyle(
            color: GLobalVariables.baseColor,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
      ),
    );
  }
}
