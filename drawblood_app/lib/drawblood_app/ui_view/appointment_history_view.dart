import 'package:drawblood_app/main.dart';
import 'package:flutter/material.dart';
import '../drawbood_app_theme.dart';

class AppointmentView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const AppointmentView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Text('abd'),
            ),
          ),
        );
      },
    );
  }
}
