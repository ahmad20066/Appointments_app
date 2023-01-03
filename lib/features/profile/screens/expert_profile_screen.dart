import 'dart:io';

import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/middleText.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/features/profile/widgets/expert/consultation/consultation_list.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_card.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_list.dart';
import 'package:appointments/features/profile/widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class ExpertProfileScreen extends StatefulWidget {
  ExpertProfileScreen({Key? key}) : super(key: key);

  @override
  State<ExpertProfileScreen> createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: GLobalVariables.baseColor,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                TitleWidget(text: 'Manage Your Profile'),
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: image == null
                      ? const AssetImage('assets/images/an.png')
                      : FileImage(image!) as ImageProvider,
                ),
                TextButton.icon(
                    onPressed: () async {
                      final file = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (file == null) {
                        return;
                      }
                      setState(() {
                        image = File(file.path);
                      });
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Change your profile image',
                      style: TextStyle(color: Colors.white),
                    )),
                InfoRow(icon: Icons.phone, value: "093333333"),
                InfoRow(icon: Icons.email_outlined, value: "ahmad@gmail.com"),
                InfoRow(
                  icon: Icons.location_on_outlined,
                  value: "Damascus Syria",
                  isFill: true,
                ),
                MiddleText(text: 'Experiences'),
                if (Provider.of<UserProvider>(context).experiences.isNotEmpty)
                  Align(
                    alignment: Alignment(-0.8, 1),
                    child: Text(
                      "(swipe right for more actions)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                SizedBox(
                  height: 5.h,
                ),
                ExperienceList(),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    isFill: true,
                    function: () {},
                    height: 50.h,
                    width: 200.w,
                    text: "Add Experience"),
                MiddleText(text: "Consultations"),
                if (Provider.of<UserProvider>(context).consultations.isNotEmpty)
                  Align(
                    alignment: Alignment(-0.8, 1),
                    child: Text(
                      "(swipe right for more actions)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ConsultaionList(),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    isFill: true,
                    function: () {},
                    height: 50.h,
                    width: 200.w,
                    text: "Add Consultation"),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
