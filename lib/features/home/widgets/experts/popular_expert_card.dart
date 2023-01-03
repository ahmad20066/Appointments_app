import 'package:appointments/features/experts/screens/expert_details_screen.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/end_points.dart';

class PopularExpertCard extends StatelessWidget {
  final ExpertModel expert;
  const PopularExpertCard({Key? key, required this.expert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ExpertDetails.routeName,
            arguments: expert);
      },
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                '${EndPoints.baseUrl}/images/expert/${expert.image}',
                height: 150.h,
                width: 190.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Text(
                    expert.name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    expert.specialization,
                    style: TextStyle(fontSize: 15.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
