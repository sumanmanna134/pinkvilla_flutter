import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/ColorConstants/colors.dart';
import 'package:pinkvilla_flutter/Screens/HomePage/home_page.dart';

class getBody extends StatelessWidget {
  final int pageIndex;

  const getBody({Key key, this.pageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text("Discover",style: TextStyle(
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Upload",style: TextStyle(
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("All Activity",style: TextStyle(
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Profile",style: TextStyle(
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }
}
