import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.dehaze,
          size: 30,
          color: Colors.white,
        ),
        Column(
          children: [
            Text(
              'Ahmad Afif',
              style:
                  TextStyle(color: Colors.white, fontFamily: '', fontSize: 15),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 15.sp,
                ),
                Text('Damascus Syria',
                    style: TextStyle(color: Colors.white, fontFamily: ''))
              ],
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/an.png'),
        )
      ],
    );
  }
}
