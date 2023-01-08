import 'package:appointments/common/local/helpers.dart';
import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/error_popup.dart';
import 'package:appointments/common/widgets/success_popup.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTime extends StatefulWidget {
  const AddTime({super.key});

  @override
  State<AddTime> createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  String? startTime;
  String? endTime;

  List<String> days = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday'
  ];
  String? day;
  @override
  void didChangeDependencies() {
    day = days[0];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 300.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Add Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            DropdownButton(
                elevation: 12,
                value: day,
                items: days
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(Helpers.capitalize(e))))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    day = value!;
                  });
                }),
            ExpansionTile(
              leading: Text(
                "Start Time:",
                style: TextStyle(
                  color: GLobalVariables.baseColor,
                  fontSize: 17.sp,
                ),
              ),
              title: Text(
                startTime ?? '',
                style: TextStyle(
                    color: GLobalVariables.baseColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.deepOrange),
                  highlightedTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.yellow),
                  spacing: 50,
                  itemHeight: 60,
                  // isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      startTime = DateFormat('hh:mm a').format(time);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ExpansionTile(
              leading: Text(
                "End Time:",
                style: TextStyle(
                  color: GLobalVariables.baseColor,
                  fontSize: 17.sp,
                ),
              ),
              title: Text(
                endTime ?? '',
                style: TextStyle(
                    color: GLobalVariables.baseColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.deepOrange),
                  highlightedTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.yellow),
                  spacing: 50,
                  itemHeight: 60,
                  // isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      endTime = DateFormat('hh:mm a').format(time);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              function: () async {
                if (day == null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorPopUp(e: "Please add a day");
                      });
                  return;
                }
                if (startTime == null || endTime == null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorPopUp(e: "Please add time");
                      });
                  return;
                }
                if (await Provider.of<UserProvider>(context, listen: false)
                    .addTime(day!, startTime!.substring(0, 5),
                        endTime!.substring(0, 5))) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessPopUp(message: "Time added Succesfully");
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorPopUp(e: "Something Went Wrong");
                      });
                }
              },
              height: 50.h,
              width: 100.w,
              text: "Submit",
              isFill: true,
            )
          ],
        ),
      ),
    ));
  }
}
