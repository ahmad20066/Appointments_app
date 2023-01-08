import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ConsultationCard extends StatelessWidget {
  final ConsultationModel consultation;

  ConsultationCard({super.key, required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: GLobalVariables.baseColor,
      child: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                consultation.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "${consultation.price}\$",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(consultation.description),
          ],
        ),
      ),
    );
  }
}
