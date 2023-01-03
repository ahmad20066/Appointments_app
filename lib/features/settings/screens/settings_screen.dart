import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/auth/providers/auth_provider.dart';
import 'package:appointments/features/auth/screens/welcome_screen.dart';
import 'package:appointments/features/settings/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: GLobalVariables.baseColor,
          height: MediaQuery.of(context).size.height / 2,
        ),
        Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TitleWidget(
                text: 'Settings',
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SettingsCard(
                  title: 'Log Out',
                  icon: Icons.logout,
                  onTap: () async {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .logOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (route) => false);
                  },
                ),
                SettingsCard(
                  onTap: () {},
                  title: 'Edit Profile',
                  icon: Icons.person,
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
