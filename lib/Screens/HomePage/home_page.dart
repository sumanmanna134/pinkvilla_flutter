import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinkvilla_flutter/ColorConstants/colors.dart';
import 'package:pinkvilla_flutter/Network/NetworkHandler.dart';
import 'package:pinkvilla_flutter/Screens/HomePage/getHomePageBody.dart';
import 'package:http/http.dart' as http;
import 'package:pinkvilla_flutter/model/Pinkvila_Model/pink_vila_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int len_Data;
  List<PinkVillaModel> _pinkVilaModelData = <PinkVillaModel>[];

  void getData() async {
    final Stream<PinkVillaModel> stream = await fetchingResponse();
    stream.listen((PinkVillaModel pinkVillaModel) {
      setState(() {
        _pinkVilaModelData.add(pinkVillaModel);
      });
    });
    

  }
  @override
  void initState() {
    super.initState();
    getData();
    print(_pinkVilaModelData.length);

//    this.fetchData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: Center(
        child: _pinkVilaModelData.isEmpty == true ? SizedBox(
          height: 50.0,width: 50.0,
            child: CircularProgressIndicator(backgroundColor: Colors.deepOrange,valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),)): getHomePageData(pinkVila: _pinkVilaModelData,),
      )
    );
  }


}




