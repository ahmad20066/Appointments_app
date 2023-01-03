import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;

  final VoidCallback function;
  final String? text;
  final EdgeInsets margin;
  bool isFill;
  CustomButton(
      {Key? key,
      required this.function,
      required this.height,
      required this.width,
      this.margin = EdgeInsets.zero,
      this.isFill = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          margin: margin,
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isFill ? GLobalVariables.baseColor : Colors.white,
          ),
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: isFill ? Colors.white : GLobalVariables.baseColor),
          )),
    );
  }
}
