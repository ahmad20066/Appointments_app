import 'package:appointments/common/widgets/custom_dialog.dart';
import 'package:appointments/common/widgets/error_popup.dart';
import 'package:appointments/common/widgets/success_popup.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/experts/providers/experts_provider.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AvailabletimesList extends StatefulWidget {
  final int conId;

  const AvailabletimesList({
    super.key,
    required this.conId,
  });

  @override
  State<AvailabletimesList> createState() => _AvailabletimesListState();
}

class _AvailabletimesListState extends State<AvailabletimesList> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context2) {
    return Stack(
      children: [
        FutureBuilder(
            future: Provider.of<ExpertsProvider>(context, listen: false)
                .getExpertRegisterations(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final times =
                  Provider.of<ExpertsProvider>(context).expertRegisteration;
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: times.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: 10.w),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        times[index].day[0].toUpperCase() +
                            times[index].day.substring(1).toLowerCase(),
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: times[index].registered
                            ? null
                            : () async {
                                bool isSure = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialog(
                                          content:
                                              'Are You Sure you want to make this appointment',
                                          title: "Are You Sure?",
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                },
                                                child: Text("Yes")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                                child: Text("No")),
                                          ]);
                                    });
                                if (isSure) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final success = await Provider.of<
                                          UserProvider>(context, listen: false)
                                      .reserve(times[index].id, widget.conId);
                                  if (success) {
                                    await showDialog(
                                        context: context2,
                                        builder: (context2) {
                                          return SuccessPopUp(
                                              message:
                                                  "Appointment made on ${times[index].day}");
                                        });
                                  } else {
                                    showDialog(
                                        context: context2,
                                        builder: (context2) {
                                          return ErrorPopUp(
                                              e: "Something went wrong please try again later");
                                        });
                                  }
                                } else {
                                  return;
                                }
                                setState(() {
                                  isLoading = false;
                                });
                                isSure = false;
                              },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              color: !times[index].registered
                                  ? Colors.white
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: GLobalVariables.baseColor, width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                times[index].start_time.substring(
                                    0, times[index].start_time.length - 2),
                                style: TextStyle(
                                    color: !times[index].registered
                                        ? GLobalVariables.baseColor
                                        : Colors.white),
                              ),
                              Text(
                                '-->',
                                style: TextStyle(
                                    color: !times[index].registered
                                        ? GLobalVariables.baseColor
                                        : Colors.white),
                              ),
                              Text(
                                times[index].end_time.substring(
                                    0, times[index].end_time.length - 2),
                                style: TextStyle(
                                    color: !times[index].registered
                                        ? GLobalVariables.baseColor
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.grey[300]!.withOpacity(0.5),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            ),
          )
      ],
    );
  }
}
