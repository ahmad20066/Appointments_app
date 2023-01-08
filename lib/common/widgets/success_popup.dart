import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class SuccessPopUp extends StatelessWidget {
  final String message;
  const SuccessPopUp({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      actions: [
        CustomButton(
          text: 'Confirm',
          width: 100.w,
          height: 50.h,
          function: () {
            Navigator.pop(context);
          },
        )
      ],
      icon: Icon(
        Icons.check,
        color: Colors.green,
        size: 35,
      ),
      title: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: Text(
          'Success',
          textAlign: TextAlign.center,
        ),
      ),
      content: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 80.h,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
    );
  }
}
