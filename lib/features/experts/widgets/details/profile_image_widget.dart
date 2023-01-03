import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  final String image;

  const ProfileImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 65.sp,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 55.sp,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
