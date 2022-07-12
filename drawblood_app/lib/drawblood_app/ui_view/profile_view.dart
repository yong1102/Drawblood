import '../drawbood_app_theme.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ProfileView({Key? key, this.animationController, this.animation})
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
                    color: drawbloodAppTheme.white,
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
                            child: Column(children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 42.0,
                                    backgroundColor:
                                        Color(0xff000000).withOpacity(0.3),
                                    child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/drawblood_app/face.jpg'),
                                        radius: 40.0),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Text(
                                      'Personal Information',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: 0.18,
                                        color: drawbloodAppTheme.darkerText,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Username',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.grey
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Username123',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.darkText,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Email',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.grey
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Email@gmail.com',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.darkText,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Phone Number',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.grey
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      '+60127845963',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.darkText,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Blood Group',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.grey
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'O+',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.darkText,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Reward Point',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.grey
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      '156',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: drawbloodAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: drawbloodAppTheme.darkText,
                                      ),
                                    ),
                                  )
                                ],
                              )
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
