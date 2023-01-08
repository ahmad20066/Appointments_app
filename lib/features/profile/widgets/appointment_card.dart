import 'package:appointments/common/local/helpers.dart';
import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/error_popup.dart';
import 'package:appointments/common/widgets/success_popup.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/models/appointment.dart';
import 'package:appointments/models/time/registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

enum apState { done, upcoming }

class AppointmentCard extends StatefulWidget {
  final AppointmentModel appointment;
  AppointmentCard({super.key, required this.appointment});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  apState? state;
  double? rating;
  final now = DateTime.now();
  @override
  void didChangeDependencies() {
    state = Helpers.calculateDate(
        widget.appointment.day, widget.appointment.end_time);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.appointment.expert.id);
    return ListTile(
      leading: Container(
        height: 50.h,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            color: state == apState.upcoming ? Colors.orange : Colors.green,
            borderRadius: BorderRadius.circular(15.sp)),
        margin: EdgeInsets.all(10.sp),
        child: Text(
          state == apState.upcoming ? "UpComing" : "Done",
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        widget.appointment.start_time.substring(0, 5) +
            " => " +
            widget.appointment.end_time.substring(0, 5),
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
      subtitle: Text(widget.appointment.expert.name),
      trailing: state == apState.done
          ? IconButton(
              onPressed: () async {
                final success = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          alignment: Alignment.center,
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating2) {
                                  rating = rating2;
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomButton(
                                function: () async {
                                  if (await Provider.of<UserProvider>(context,
                                          listen: false)
                                      .rate(widget.appointment.expert.id,
                                          rating!)) {
                                    Navigator.pop(context, true);
                                  } else {
                                    Navigator.pop(context, false);
                                  }
                                },
                                height: 40.h,
                                width: 150.w,
                                text: "Submit",
                                isFill: true,
                              )
                            ],
                          ),
                        ),
                      );
                    });
                if (success) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessPopUp(
                            message: "Rating Submited Successfully");
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorPopUp(
                            e: "Something went wrong try again later");
                      });
                }
              },
              icon: Icon(
                Icons.star,
                color: Colors.amber,
              ))
          : null,
    );
  }
}
