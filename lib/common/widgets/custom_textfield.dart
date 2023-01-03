import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController textController;
  String labelText;
  bool isPrivate;
  double pMargin, hmargin;
  IconData? preIcon;
  TextInputType? type;

  CustomTextField(
      {Key? key,
      required this.textController,
      required this.labelText,
      required this.pMargin,
      required this.hmargin,
      this.isPrivate = false,
      this.type,
      this.preIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hmargin, vertical: pMargin),
      child: TextFormField(
          keyboardType: type,
          obscureText: isPrivate,
          controller: textController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              preIcon,
              color: GLobalVariables.baseColor,
            ),
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10)),
            hintText: labelText,
            hintStyle: TextStyle(color: GLobalVariables.baseColor),
          )),
    );
  }
}
