import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/models/time/available_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailabletimesList extends StatefulWidget {
  final List<AvailableTime> times;
  const AvailabletimesList({super.key, required this.times});

  @override
  State<AvailabletimesList> createState() => _AvailabletimesListState();
}

class _AvailabletimesListState extends State<AvailabletimesList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.times.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2.2, crossAxisSpacing: 10.w),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              widget.times[index].day[0].toUpperCase() +
                  widget.times[index].day.substring(1).toLowerCase(),
              style: TextStyle(fontSize: 15.sp),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.times[index].isAvailable = false;
                  print(widget.times[index].isAvailable);
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: widget.times[index].isAvailable
                        ? Colors.white
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: GLobalVariables.baseColor, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.times[index].start_time.substring(
                          0, widget.times[index].start_time.length - 2),
                      style: TextStyle(
                          color: widget.times[index].isAvailable
                              ? GLobalVariables.baseColor
                              : Colors.white),
                    ),
                    Text(
                      '-->',
                      style: TextStyle(
                          color: widget.times[index].isAvailable
                              ? GLobalVariables.baseColor
                              : Colors.white),
                    ),
                    Text(
                      widget.times[index].end_time.substring(
                          0, widget.times[index].end_time.length - 2),
                      style: TextStyle(
                          color: widget.times[index].isAvailable
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
  }
}
