import 'package:animated_background/animated_background.dart';
import 'package:appointments/common/widgets/custom_snackbar.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/auth/providers/auth_provider.dart';
import 'package:appointments/features/auth/screens/expert_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common/animations/page_transition.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../tab/tabscreen.dart';
import '../widgets/background_image.dart';
import 'dart:math' as math;

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  int value = 2;
  Widget customRadioButton(String text, int buttonvalue) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = buttonvalue;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor:
            value == buttonvalue ? Colors.white : GLobalVariables.baseColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft:
                  buttonvalue == 0 ? Radius.circular(0) : Radius.circular(15),
              bottomLeft:
                  buttonvalue == 0 ? Radius.circular(0) : Radius.circular(15),
              topRight:
                  buttonvalue == 1 ? Radius.circular(0) : Radius.circular(15),
              bottomRight:
                  buttonvalue == 1 ? Radius.circular(0) : Radius.circular(15),
            ),
            side: BorderSide(
                color: value == buttonvalue
                    ? Colors.white
                    : GLobalVariables.baseColor)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color:
              (value == buttonvalue) ? GLobalVariables.baseColor : Colors.white,
        ),
      ),
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
                  height: 90,
                ),
                TitleWidget(text: 'Sign Up And Start Exploring'),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                    textController: nameController,
                    labelText: 'Name',
                    preIcon: Icons.person,
                    pMargin: 10,
                    hmargin: 30),
                CustomTextField(
                    textController: emailController,
                    labelText: 'Email',
                    preIcon: Icons.email,
                    pMargin: 10,
                    hmargin: 30),
                CustomTextField(
                  textController: passwordController,
                  labelText: 'Password',
                  pMargin: 10,
                  hmargin: 30,
                  isPrivate: true,
                  preIcon: Icons.lock_outline,
                ),
                CustomTextField(
                    textController: confirmController,
                    isPrivate: true,
                    labelText: 'Confirm Password',
                    preIcon: Icons.check,
                    pMargin: 10,
                    hmargin: 30),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customRadioButton('Expert', 1),
                    customRadioButton('Normal', 0)
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        function: () async {
                          if (value == 1) {
                            Navigator.push(
                                context,
                                MyTransition(
                                  oldScreen: RegisterScreen(),
                                  newScreen: ExpertForm(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ));
                          } else if (value == 0) {
                            setState(() {
                              isLoading = true;
                            });
                            if (await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .register(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    'normal')) {
                              Navigator.pushNamed(
                                  context, TabsScreen.routeName);
                            }

                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackbar(
                                    isError: true,
                                    text: 'Please Select a role'));
                          }
                        },
                        height: 60,
                        width: 270,
                        text: value == 1 ? 'Continue' : 'Sign Up'),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
