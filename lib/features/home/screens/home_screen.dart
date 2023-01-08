import 'package:appointments/common/widgets/custom_appbar.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/experts/screens/categories_screen.dart';
import 'package:appointments/features/home/widgets/categories/categories_list.dart';
import 'package:appointments/features/home/widgets/experts/popular_experts_list.dart';
import 'package:appointments/features/home/widgets/experts/popular_experts_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            color: GLobalVariables.baseColor,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              CustomAppBar(),
              SizedBox(
                height: 20.h,
              ),
              TitleWidget(
                text: 'EXPLORE AND BOOK YOUR NEXT APPOINTMENT',
                size: 25.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10.sp),
                          side: BorderSide(color: Colors.white, width: 3.w)),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CategoriesScreen.routeName);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              CategoriesList(),
              PopularExpertsRow(),
              SizedBox(
                height: 10.h,
              ),
              PopularExpertsList(),
              SizedBox(
                height: 20.h,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
