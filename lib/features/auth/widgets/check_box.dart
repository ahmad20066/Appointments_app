import 'package:appointments/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            side: BorderSide(color: Colors.white, width: 2),
            activeColor: Colors.white,
            checkColor: GLobalVariables.baseColor,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            }),
        Text(
          'Keep Me Signed In',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
