import 'package:flutter/material.dart';

class MyTransition extends PageRouteBuilder {
  final Widget oldScreen;
  final Widget newScreen;
  bool isRtl;
  MyTransition(
      {required this.oldScreen, required this.newScreen, this.isRtl = false})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              newScreen,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: isRtl ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
                ).animate(animation),
                child: oldScreen,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin:
                      isRtl ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: newScreen,
              )
            ],
          ),
        );
}
