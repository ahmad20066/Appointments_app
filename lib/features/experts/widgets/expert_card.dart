import 'package:appointments/features/experts/screens/expert_details_screen.dart';
import 'package:appointments/models/expert/expert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../constants/end_points.dart';

class ExpertCard extends StatelessWidget {
  final ExpertModel expert;
  const ExpertCard({Key? key, required this.expert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ExpertDetails.routeName,
            arguments: expert);
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
              '${EndPoints.baseUrl}/images/expert/${expert.image}',
              height: 100.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
            GlassmorphicContainer(
              width: 100,
              height: 100,
              blur: 20,
              borderRadius: 0,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: Text(expert.image),
            ),
          ],
        ),
      ),
    );
  }
}
