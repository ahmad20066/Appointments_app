import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class ErrorPopUp extends StatelessWidget {
  final String e;

  const ErrorPopUp({super.key, required this.e});

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
        Icons.warning_outlined,
        color: Colors.red,
        size: 35,
      ),
      title: Container(
        alignment: Alignment.center,
        height: 50.h,
        child: Text(
          'Error',
          textAlign: TextAlign.center,
        ),
      ),
      content: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 80.h,
        child: Text(
          e,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
      ),
    );
  }
}
