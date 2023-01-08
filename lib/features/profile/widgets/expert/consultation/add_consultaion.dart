import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../../../common/widgets/error_popup.dart';
import '../../../../../common/widgets/success_popup.dart';
import '../../../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class AddConsultation extends StatelessWidget {
  AddConsultation({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
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
                    "Add Consultation",
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
                  action: TextInputAction.newline,
                  pMargin: 10,
                  hmargin: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: CustomTextField(
                        width: 100.w,
                        type: TextInputType.number,
                        action: TextInputAction.done,
                        textController: priceController,
                        labelText: "Price",
                        pMargin: 10,
                        hmargin: 0),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "\$",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                function: () async {
                  final success =
                      await Provider.of<UserProvider>(context, listen: false)
                          .addConsultation(
                              titleController.text,
                              descriptionController.text,
                              double.parse(priceController.text));
                  if (success) {
                    Navigator.pop(context);

                    await showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessPopUp(
                              message: "Consultation added succesfully");
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
