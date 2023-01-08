import 'package:appointments/common/local/helpers.dart';
import 'package:appointments/common/widgets/middleText.dart';
import 'package:appointments/constants/end_points.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/widgets/details/consultations/details_consultaion_list.dart';
import 'package:appointments/features/experts/widgets/details/experience/details_experience_list.dart';
import 'package:appointments/features/experts/widgets/details/info_widget.dart';
import 'package:appointments/features/experts/widgets/details/profile_image_widget.dart';
import 'package:appointments/features/profile/widgets/expert/experience/experience_list.dart';
import 'package:appointments/features/profile/widgets/info_row.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class ExpertDetails extends StatefulWidget {
  static const routeName = '/expert-details';
  const ExpertDetails({
    super.key,
  });

  @override
  State<ExpertDetails> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends State<ExpertDetails> {
  ExpertModel? expert;

  @override
  void didChangeDependencies() {
    expert = ModalRoute.of(context)!.settings.arguments as ExpertModel;
    Provider.of<ExpertsProvider>(context, listen: false).currentExpertId =
        expert!.id;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(15.sp),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: GLobalVariables.baseColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: BackButton(),
                              ),
                              Spacer(),
                              Text(
                                Helpers.capitalize(expert!.name),
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Text(
                                Helpers.capitalize(expert!.specialization)
                                    .substring(1)
                                    .toLowerCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 90.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfoWidget(
                                  icon: Icons.location_on_outlined,
                                  text: expert!.address),
                              SizedBox(
                                width: 20.w,
                              ),
                              InfoWidget(
                                  color: Colors.orange,
                                  text: expert!.rating.toString(),
                                  icon: Icons.star_outline),
                              SizedBox(
                                width: 20.w,
                              ),
                              InfoWidget(
                                  text: expert!.Phone_Number.toString(),
                                  icon: Icons.phone)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 70,
                      left: 90.w,
                      child: ProfileImageWidget(
                        image:
                            "${EndPoints.baseUrl}/images/expert/${expert!.image}",
                      ),
                    ),
                  ],
                ),
              ),
              MiddleText(text: 'Experiences'),
              DetailsExperienceList(experiences: expert!.experience),
              MiddleText(text: 'Consultations'),
              DetailsConsultationsList(
                consultations: expert!.consultation,
                registerations: expert!.registeraton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
