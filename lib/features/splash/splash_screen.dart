import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/auth/providers/auth_provider.dart';
import 'package:appointments/features/auth/screens/welcome_screen.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/features/tab/tabscreen.dart';
import 'package:appointments/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

enum pageState { active, done }

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? timer;

  List<String> titles = [
    'There is no greater wealth than wisdom',
    'Wise people understand the need to consult experts',
    'Consult your memory to know what matters most in your life',
  ];
  int index = 0;
  late Widget image;
  late Widget text;
  pageState state = pageState.active;
  String? token;
  @override
  Future<void> didChangeDependencies() async {
    print("ssssss");
    text = Padding(
      key: ValueKey<int>(index),
      padding: EdgeInsets.symmetric(horizontal: 25.sp),
      child: Text(
        titles[index],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'ChivoMono',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35.sp),
      ),
    );
    token = await locator.get<LocalRepo>().getToken();
    if (token != null) {
      try {
        await Provider.of<UserProvider>(context, listen: false).getProfile();
        if (state == pageState.done) {
          Navigator.of(context).pushNamed(TabsScreen.routeName);
        } else {
          state = pageState.done;
        }
      } catch (e) {
        print(e);
        await Provider.of<AuthProvider>(context, listen: false).logOut();
        locator.get<LocalRepo>().token = null;
        if (state == pageState.done) {
          Navigator.of(context).pushNamed(WelcomeScreen.routeName);
        } else {
          state = pageState.done;
        }
      }
    } else {
      if (state == pageState.done) {
        Navigator.of(context).pushNamed(WelcomeScreen.routeName);
      } else {
        state = pageState.done;
      }
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (index == 2) {
        timer.cancel();
        if (state == pageState.done) {
          if (locator.get<LocalRepo>().token != null) {
            Navigator.pushNamed(context, TabsScreen.routeName);
          } else {
            Navigator.pushNamed(context, WelcomeScreen.routeName);
          }
        } else {
          state = pageState.done;
        }
        return;
      }
      index = index + 1;
      setState(() {
        text = Padding(
          key: ValueKey<int>(index),
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          child: Text(
            titles[index],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'ChivoMono',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(state);
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          color: GLobalVariables.baseColor,
        ),
        Positioned.fill(
          child: AnimatedBackground(
            vsync: this,
            behaviour: RacingLinesBehaviour(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                AnimatedSwitcher(
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final offsetAnimation = Tween(
                      begin: const Offset(-1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(animation);
                    return SlideTransition(
                        child: child, position: offsetAnimation);
                  },
                  duration: Duration(milliseconds: 1000),
                  child: text,
                ),
                SizedBox(
                  height: 30.h,
                ),
                // Expanded(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: AnimatedSwitcher(
                //       transitionBuilder:
                //           (Widget child, Animation<double> animation) {
                //         final offsetAnimation = Tween(
                //           begin: const Offset(-1.0, 0.0),
                //           end: const Offset(0.0, 0.0),
                //         ).animate(animation);
                //         return SlideTransition(
                //             child: child, position: offsetAnimation);
                //       },
                //       duration: Duration(milliseconds: 1000),
                //       child: image,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
