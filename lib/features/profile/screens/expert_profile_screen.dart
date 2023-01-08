import 'dart:io';

import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/middleText.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/features/profile/widgets/appointments_list.dart';
import 'package:appointments/features/profile/widgets/balance_widget.dart';
import 'package:appointments/features/profile/widgets/expert/consultation/add_consultaion.dart';
import 'package:appointments/features/profile/widgets/expert/consultation/consultation_list.dart';
import 'package:appointments/features/profile/widgets/expert/experience/add_experience.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_card.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_list.dart';
import 'package:appointments/features/profile/widgets/expert/time/add_time.dart';
import 'package:appointments/features/profile/widgets/expert/time/times_card.dart';
import 'package:appointments/features/profile/widgets/hint_text.dart';
import 'package:appointments/features/profile/widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../constants/end_points.dart';
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
      body: FutureBuilder(
          future:
              Provider.of<UserProvider>(context, listen: false).getProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = Provider.of<UserProvider>(context).currentUser;
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    color: GLobalVariables.baseColor,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Provider.of<UserProvider>(context, listen: false)
                              .currentUser!
                              .role ==
                          'expert'
                      ? Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            TitleWidget(text: 'Manage Your Profile'),
                            SizedBox(
                              height: 10.h,
                            ),
                            CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.white,
                                backgroundImage: user!.image == null
                                    ? const AssetImage('assets/images/an.png')
                                    : image == null
                                        ? NetworkImage(
                                            "${EndPoints.baseUrl}/images/expert/${user!.image!}")
                                        : FileImage(image!) as ImageProvider),
                            // TextButton.icon(
                            //     onPressed: () async {
                            //       final file = await ImagePicker()
                            //           .pickImage(source: ImageSource.camera);
                            //       if (file == null) {
                            //         return;
                            //       }
                            //       setState(() {
                            //         image = File(file.path);
                            //       });
                            //     },
                            //     icon: Icon(
                            //       Icons.image,
                            //       color: Colors.white,
                            //     ),
                            //     label: Text(
                            //       'Change your profile image',
                            //       style: TextStyle(color: Colors.white),
                            //     )),
                            InfoRow(
                                icon: Icons.phone,
                                value: user.Phone_Number == null
                                    ? ''
                                    : user.Phone_Number!),
                            InfoRow(
                                icon: Icons.email_outlined, value: user.email),
                            InfoRow(
                              icon: Icons.location_on_outlined,
                              value: user.address == null ? '' : user.address!,
                              isFill: true,
                            ),
                            BalanceWidget(balance: user.balance),

                            ExpansionTile(
                              title: Text(
                                "Appointments",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                              children: [AppointmentsList()],
                            ),
                            MiddleText(text: 'Experiences'),
                            if (user.experience!.isNotEmpty)
                              HintTitle(text: "swipe right for more actions"),
                            SizedBox(
                              height: 5.h,
                            ),
                            ExperienceList(),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                                isFill: true,
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AddExperienceDialog());
                                },
                                height: 50.h,
                                width: 200.w,
                                text: "Add Experience"),
                            MiddleText(text: "Consultations"),
                            if (user.consultation!.isNotEmpty)
                              HintTitle(text: "swipe right for more actions"),
                            ConsultaionList(),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                                isFill: true,
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddConsultation());
                                },
                                height: 50.h,
                                width: 200.w,
                                text: "Add Consultation"),
                            SizedBox(
                              height: 20.h,
                            ),
                            MiddleText(text: "Available Times"),
                            if (user.availabletime!.isNotEmpty)
                              HintTitle(
                                  text: "Add your available times of the week"),
                            TimesCard(),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                                isFill: true,
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddTime());
                                },
                                height: 50.h,
                                width: 150.w,
                                text: "Add Time"),
                            SizedBox(
                              height: 50.h,
                            )
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            TitleWidget(text: 'Manage Your Profile'),
                            SizedBox(
                              height: 30.h,
                            ),
                            CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.white,
                                backgroundImage: user!.image == null
                                    ? const AssetImage('assets/images/an.png')
                                    : image == null
                                        ? NetworkImage(
                                            "${EndPoints.baseUrl}/images/expert/${user!.image!}")
                                        : FileImage(image!) as ImageProvider),
                            // TextButton.icon(
                            //     onPressed: () async {
                            //       final file = await ImagePicker()
                            //           .pickImage(source: ImageSource.camera);
                            //       if (file == null) {
                            //         return;
                            //       }
                            //       setState(() {
                            //         image = File(file.path);
                            //       });
                            //     },
                            //     icon: Icon(
                            //       Icons.image,
                            //       color: Colors.white,
                            //     ),
                            //     label: Text(
                            //       'Change your profile image',
                            //       style: TextStyle(color: Colors.white),
                            //     )),
                            SizedBox(
                              height: 20.h,
                            ),
                            InfoRow(
                                icon: Icons.email_outlined, value: user.email),
                            SizedBox(
                              height: 20.h,
                            ),

                            BalanceWidget(balance: user.balance),

                            ExpansionTile(
                              title: Text(
                                "Appointments",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                              children: [AppointmentsList()],
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                          ],
                        )
                ],
              ),
            );
          }),
    );
  }
}
