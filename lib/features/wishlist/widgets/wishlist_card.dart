import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/wishlist/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/end_points.dart';

class WishlistCard extends StatelessWidget {
  final WishListItem item;
  const WishlistCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: GLobalVariables.baseColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            height: 140.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                "${EndPoints.baseUrl}/images/expert/${item.image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            item.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
