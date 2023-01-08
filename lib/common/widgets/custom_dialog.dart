import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final String content;
  final String title;
  final List<Widget> actions;
  const CustomDialog(
      {super.key,
      required this.content,
      required this.title,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      actions: actions,
      content: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 80.h,
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
      ),
    );
  }
}
