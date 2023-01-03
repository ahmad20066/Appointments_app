import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PopularExpertsRow extends StatelessWidget {
  const PopularExpertsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        Text(
          'Popular Experts',
          style: TextStyle(color: GLobalVariables.baseColor, fontSize: 18.sp),
        ),
        Spacer(),
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.all(10.sp),
                side: BorderSide(color: GLobalVariables.baseColor, width: 3.w)),
            onPressed: () {
              Provider.of<ExpertsProvider>(context, listen: false)
                  .nullCategory();
              Navigator.pushNamed(context, ExpertsScreen.routeName);
            },
            child: Text(
              'See All',
              style:
                  TextStyle(color: GLobalVariables.baseColor, fontSize: 16.sp),
            )),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
