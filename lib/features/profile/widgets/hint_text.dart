import 'package:flutter/material.dart';

class HintTitle extends StatelessWidget {
  final String text;
  const HintTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.8, 1),
      child: Text(
        "(" + text + ")",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
