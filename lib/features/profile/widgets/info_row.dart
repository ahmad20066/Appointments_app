import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String value;
  bool isFill;
  InfoRow(
      {super.key,
      required this.icon,
      required this.value,
      this.isFill = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: 0),
      leading: Icon(
        icon,
        color: isFill ? GLobalVariables.baseColor : Colors.white,
        size: 20.sp,
      ),
      title: Text(
        value,
        style: TextStyle(
            color: isFill ? GLobalVariables.baseColor : Colors.white,
            fontSize: 15.sp),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            color: isFill ? GLobalVariables.baseColor : Colors.white,
            size: 20.sp,
          )),
    );
  }
}
