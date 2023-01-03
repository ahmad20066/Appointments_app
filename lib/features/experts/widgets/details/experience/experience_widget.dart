import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExperienceWidget extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceWidget({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: GLobalVariables.baseColor, width: 2)),
      margin: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  experience.title,
                  style: TextStyle(
                      color: GLobalVariables.baseColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(experience.years.toString() + ' Years')
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            experience.description,
            style: TextStyle(height: 1.6),
          )
        ],
      ),
    );
  }
}
