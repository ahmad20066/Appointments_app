import 'package:appointments/features/experts/widgets/details/consultations/available_times_list.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/global_variables.dart';

class ConsultationWidget extends StatelessWidget {
  final ConsultationModel consultation;
  final List<AvailableTime> availableTimes;
  const ConsultationWidget(
      {super.key, required this.consultation, required this.availableTimes});

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
                  consultation.title,
                  style: TextStyle(
                      color: GLobalVariables.baseColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text('${consultation.price}\$')
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            consultation.description,
            style: TextStyle(height: 1.6),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Make an appointment:',
              style: TextStyle(
                  color: GLobalVariables.baseColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AvailabletimesList(times: availableTimes)
        ],
      ),
    );
  }
}
