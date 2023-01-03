import 'package:animated_background/animated_background.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/auth/widgets/two_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/back.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          AnimatedBackground(
            behaviour: RacingLinesBehaviour(direction: LineDirection.Ltr),
            vsync: this,
            child: Column(
              children: [
                Spacer(),
                TitleWidget(text: 'EVERYTHING YOU IMAGINE IS REAL'),
                SizedBox(
                  height: 15.h,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment(-0.5, 1),
                  child: Container(
                    width: 270.w,
                    child: Text(
                      'Make your life easier by using our application',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const Spacer(),
                const Align(
                    alignment: Alignment.topCenter, child: TwoButtonWidget()),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
