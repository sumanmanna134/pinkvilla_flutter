import 'package:pinkvilla_flutter/model/Pinkvila_Model/pink_vila_model.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
  Future<Stream<PinkVillaModel>> fetchingResponse() async {
    String baseUrl = "https://www.pinkvilla.com/feed/video-test/video-feed.json";
   final client = http.Client();
   final streamedRest = await client.send(http.Request('get',Uri.parse(baseUrl)));
    if(streamedRest.statusCode == 200 || streamedRest.statusCode == 201){
      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .expand((data) => (data as List))
          .map((data) => PinkVillaModel.fromJson(data));


    }else{
      throw Exception('Unable to fetch data');
    }
  }
