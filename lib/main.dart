import 'package:appointments/features/auth/screens/expert_form.dart';
import 'package:appointments/features/auth/screens/register_screen.dart';
import 'package:appointments/features/auth/screens/welcome_screen.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/expert_details_screen.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:appointments/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features/auth/providers/auth_provider.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/profile/providers/user_provider.dart';
import 'features/tab/tabscreen.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExpertsProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(),
          // builder: (context, child) => SafeArea(child: child!),
          initialRoute: WelcomeScreen.routeName,
          routes: {
            WelcomeScreen.routeName: (context) => WelcomeScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LogInScreen.routeName: (context) => LogInScreen(),
            ExpertsScreen.routeName: (context) => ExpertsScreen(),
            TabsScreen.routeName: (context) => TabsScreen(),
            ExpertDetails.routeName: (context) => ExpertDetails(),
          },
        ),
      ),
    );
  }
}
