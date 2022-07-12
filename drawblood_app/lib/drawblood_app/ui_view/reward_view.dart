import '../drawbood_app_theme.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class RewardView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const RewardView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/drawblood_app/reward_bckgrd.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: drawbloodAppTheme.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 16),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 4),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'AVAILABLE POINTS',
                                    style: TextStyle(
                                      fontFamily: drawbloodAppTheme.fontName,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: 0.18,
                                      color: drawbloodAppTheme.nearlyWhite
                                          .withOpacity(0.85),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "156",
                                        style: TextStyle(
                                          fontFamily:
                                              drawbloodAppTheme.fontName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35,
                                          letterSpacing: 0.18,
                                          color: drawbloodAppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 12, bottom: 12),
                                      child: Row(
                                        children: <Widget>[],
                                      ))
                                ]),
                          ))
                        ]),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
