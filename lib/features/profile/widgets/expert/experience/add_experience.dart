import 'package:appointments/common/widgets/custom_button.dart';
import 'package:appointments/common/widgets/custom_textfield.dart';
import 'package:appointments/common/widgets/error_popup.dart';
import 'package:appointments/common/widgets/success_popup.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddExperienceDialog extends StatelessWidget {
  AddExperienceDialog({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 420.h,
        width: 300.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add Experience",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: GLobalVariables.baseColor),
                  )),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                  textController: titleController,
                  labelText: "Title",
                  pMargin: 10,
                  hmargin: 15),
              CustomTextField(
                  isLarge: true,
                  textController: descriptionController,
                  labelText: "Description",
                  pMargin: 10,
                  action: TextInputAction.newline,
                  hmargin: 15),
              CustomTextField(
                  type: TextInputType.number,
                  textController: yearsController,
                  labelText: "Years",
                  action: TextInputAction.done,
                  pMargin: 10,
                  hmargin: 15),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                function: () async {
                  print(yearsController.text);
                  final success =
                      await Provider.of<UserProvider>(context, listen: false)
                          .addExperience(
                              titleController.text,
                              descriptionController.text,
                              double.parse(yearsController.text));
                  if (success) {
                    Navigator.pop(context);

                    await showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessPopUp(
                              message: "Experience added succesfully");
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorPopUp(
                              e: "Error adding Experience please try again later");
                        });
                  }
                },
                height: 50.h,
                width: 140.w,
                text: "Submit",
                isFill: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
