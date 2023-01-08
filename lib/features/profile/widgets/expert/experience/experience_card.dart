import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;

  ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: GLobalVariables.baseColor,
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  experience.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Spacer(),
                Text("${experience.years} years"),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment(-0.8, 1),
              child: Text(experience.description),
            )
          ],
        ),
      ),
    );
  }
}
