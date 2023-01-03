import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/consultaion/consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ConsultationCard extends StatelessWidget {
  final ConsultationModel consultation;
  final VoidCallback onDissmiss;
  ConsultationCard(
      {super.key, required this.consultation, required this.onDissmiss});
  Color dissmissableColor = Colors.red;
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
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: GLobalVariables.baseColor,
        child: Container(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  consultation.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${consultation.price}\$",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(consultation.description),
            ],
          ),
        ),
      ),
    );
  }
}
