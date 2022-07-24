import 'package:drawblood_app/drawblood_app/models/reward_list_data.dart';
import 'package:drawblood_app/firebase_info.dart';

import '../drawbood_app_theme.dart';

import 'package:flutter/material.dart';

class RewardListView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const RewardListView({Key? key, this.animationController, this.animation})
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
                child: StreamBuilder<List<RewardModel>>(
                  stream: FirestoreQuery.readReward(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: drawbloodAppTheme.red,
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: drawbloodAppTheme.fontName,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 0.18,
                              color: drawbloodAppTheme.darkText),
                        ),
                      );
                    }

                    if (snapshot.hasData) {
                      final rewardData = snapshot.data;
                      return Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: rewardData!.length,
                              itemBuilder: (context, index) {
                                final rewardInfo = rewardData[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: drawbloodAppTheme.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: drawbloodAppTheme.grey
                                              .withOpacity(0.2),
                                          offset: Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        leading: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/drawblood_app/reward_default.png"))),
                                        ),
                                        title: Text(
                                          "${rewardInfo.reward_name}",
                                          style: TextStyle(
                                            fontFamily:
                                                drawbloodAppTheme.fontName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            letterSpacing: 0.18,
                                            color: drawbloodAppTheme.darkerText,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${rewardInfo.description}",
                                          style: TextStyle(
                                            fontFamily:
                                                drawbloodAppTheme.fontName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            letterSpacing: 0.18,
                                            color: drawbloodAppTheme.grey
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        trailing: Container(
                                          height: 30,
                                          width: 60,
                                          child: RaisedButton(
                                              textColor:
                                                  drawbloodAppTheme.white,
                                              color: drawbloodAppTheme.red,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              16.0))),
                                              onPressed: () {},
                                              child: Text(
                                                "${rewardInfo.redeem_point}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: drawbloodAppTheme
                                                      .fontName,
                                                  fontSize: 14,
                                                  letterSpacing: 0.18,
                                                ),
                                              )),
                                        ),
                                      )),
                                );
                              }));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: drawbloodAppTheme.red,
                    ));
                  },
                )),
          ),
        );
      },
    );
  }
}
