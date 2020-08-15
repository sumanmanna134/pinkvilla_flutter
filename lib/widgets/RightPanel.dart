import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/AppIcon/AppIcon.dart';

import 'column_social_icon.dart';
class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  const RightPanel({
    Key key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    getProfile(profileImg),
                    getIcons(AppIcons.heart, likes, 35.0),
                    getIcons(AppIcons.chat_bubble, comments, 35.0),
                    getIcons(AppIcons.reply, shares, 25.0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}