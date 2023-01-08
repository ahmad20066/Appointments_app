import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/experts/screens/experts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/end_points.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final int id;
  const CategoryCard(
      {Key? key, required this.image, required this.text, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ExpertsProvider>(context, listen: false).selectCategory(id);
        Navigator.pushNamed(context, ExpertsScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: GLobalVariables.baseColor,
                spreadRadius: 5)
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                NetworkImage('${EndPoints.baseUrl}/images/expert/$image'),
                color: GLobalVariables.baseColor,
                size: 40.sp,
              ),
              Text(
                text,
                style: TextStyle(color: GLobalVariables.baseColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
