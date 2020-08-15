import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/constant/Bottom_Nav_IconList.dart';
import 'package:pinkvilla_flutter/ColorConstants/colors.dart';

import 'package:pinkvilla_flutter/widgets/upload_icon.dart';

import 'Body.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(pageIndex: pageIndex,),
      bottomNavigationBar: getFooter(),
    );
  }


  Widget getFooter() {

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length,(index){
            return bottomItems[index]['isIcon'] ?
            InkWell(
              onTap: (){
                selectedTab(index);
              },
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                   bottomItems[index]['icon'],
                    color: white ,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      bottomItems[index]['label'],
                      style: TextStyle(color: white, fontSize: 10),
                    ),
                  )
                ],
              ),
            ) :
            InkWell(
              onTap: (){
                selectedTab(index);
              },
              child: UploadIcon()
              );
          }),
        ),
      ),
    );
  }
  selectedTab(index){
    setState(() {
      pageIndex = index;
    });
  }
}


