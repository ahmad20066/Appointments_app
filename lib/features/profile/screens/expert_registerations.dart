import 'package:appointments/common/local/helpers.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExpertRegisterations extends StatelessWidget {
  static const routeName = '/experts_reg';
  const ExpertRegisterations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registerations"),
      ),
      body: FutureBuilder(
          future:
              Provider.of<UserProvider>(context, listen: false).getExpertRegs(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: Provider.of<UserProvider>(context, listen: false)
                    .expertRegs
                    .length,
                itemBuilder: (context, index) {
                  final reg =
                      Provider.of<UserProvider>(context).expertRegs[index];
                  return ListTile(
                    title: Text(reg.start_time.substring(0, 5) +
                        " => " +
                        reg.start_time.substring(0, 5)),
                    subtitle: Text(reg.user.name),
                    leading: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          color: GLobalVariables.baseColor,
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: Text(
                        Helpers.capitalize(reg.day),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
