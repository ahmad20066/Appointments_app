import 'package:appointments/common/animations/page_transition.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/auth/screens/login_screen.dart';
import 'package:appointments/features/auth/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/register_screen.dart';

class TwoButtonWidget extends StatelessWidget {
  const TwoButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MyTransition(
                    oldScreen: WelcomeScreen(),
                    newScreen: LogInScreen(),
                    isRtl: true));
          },
          child: Container(
            padding: EdgeInsets.all(30.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: Colors.white),
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: GLobalVariables.baseColor),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MyTransition(
                  oldScreen: WelcomeScreen(),
                  newScreen: RegisterScreen(),
                ));
          },
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: GLobalVariables.baseColor),
            child: Text(
              'REGISTER',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
