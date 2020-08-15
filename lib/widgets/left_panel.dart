import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/ColorConstants/colors.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 5,
          ),

        ],
      ),
    );
  }
}