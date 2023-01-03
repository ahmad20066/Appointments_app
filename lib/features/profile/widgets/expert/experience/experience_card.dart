import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/experience/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  VoidCallback onDissmiss;
  ExperienceCard(
      {super.key, required this.experience, required this.onDissmiss});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) async {
            bool confirm = false;
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    icon: Icon(
                      Icons.warning,
                      color: Colors.red,
                      size: 35.sp,
                    ),
                    title: Text("Are you sure?"),
                    content: Text("are you sure you want to delete?"),
                    actions: [
                      TextButton(
                          onPressed: onDissmiss,
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  );
                });
          },
          icon: Icons.delete,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        SlidableAction(
          onPressed: (context) {},
          icon: Icons.edit,
          backgroundColor: GLobalVariables.baseColor,
          foregroundColor: Colors.white,
        ),
      ]),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: GLobalVariables.baseColor,
        elevation: 6,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        child: Container(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    experience.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  Spacer(),
                  Text("${experience.years} years"),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment(-0.8, 1),
                child: Text(experience.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
