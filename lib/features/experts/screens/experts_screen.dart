import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/features/experts/widgets/experts_list.dart';
import 'package:appointments/features/experts/widgets/tags_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/global_variables.dart';

class ExpertsScreen extends StatelessWidget {
  static const routeName = '/experts-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: GLobalVariables.baseColor,
            height: MediaQuery.of(context).size.height / 4,
          ),
          Column(
            children: [
              SizedBox(
                height: 100.h,
                child: Align(
                  alignment: Alignment(-0.9, 0.5),
                  child: Container(
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-1, 1),
                child: TitleWidget(
                  text: 'Find Your Expert',
                  size: 25.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TagsList(),
              ExpertsList()
            ],
          ),
        ],
      ),
    );
  }
}
