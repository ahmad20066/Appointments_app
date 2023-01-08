import 'package:appointments/common/local/helpers.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TimesCard extends StatelessWidget {
  const TimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final availableTimes =
        Provider.of<UserProvider>(context).currentUser!.availabletime!;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: availableTimes.length,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              visualDensity: VisualDensity(vertical: 4),
              leading: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                    color: GLobalVariables.baseColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  Helpers.capitalize(availableTimes[index].day),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                availableTimes[index].start_time +
                    "-->" +
                    availableTimes[index].end_time,
                style: TextStyle(fontSize: 17.sp),
              ),
            );
          }),
    );
  }
}
