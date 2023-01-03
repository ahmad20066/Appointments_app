import 'package:animated_background/animated_background.dart';
import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/custom_textfield.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/auth/providers/auth_provider.dart';
import 'package:appointments/features/auth/widgets/background_image.dart';
import 'package:appointments/features/auth/widgets/check_box.dart';
import 'package:appointments/features/tab/tabscreen.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: BackGroundImage()),
          AnimatedBackground(
            vsync: this,
            behaviour: RacingLinesBehaviour(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  TitleWidget(text: 'LET`S SIGN YOU IN'),
                  const SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: const Alignment(-0.5, 1),
                    child: Container(
                      width: 230.w,
                      child: Text(
                        'Wlecome back, you`ve been missed',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      textController: emailController,
                      labelText: 'Email',
                      preIcon: Icons.email,
                      pMargin: 20,
                      hmargin: 30),
                  CustomTextField(
                    textController: passwordController,
                    labelText: 'Password',
                    pMargin: 20,
                    hmargin: 30,
                    isPrivate: true,
                    preIcon: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckBoxWidget(),
                  isLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          function: () async {
                            // Navigator.pushNamed(context, TabsScreen.routeName);
                            setState(() {
                              isLoading = true;
                            });
                            if (await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .login(emailController.text,
                                    passwordController.text)) {
                              Navigator.pushNamed(
                                  context, TabsScreen.routeName);
                            }

                            setState(() {
                              isLoading = false;
                            });
                          },
                          height: 60,
                          width: 270,
                          text: 'Log In'),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
