import 'dart:convert';

import 'package:logger/logger.dart';

class PinkVillaModel{
  final String videoUrl;
  final String title;
  final String name;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;

  PinkVillaModel({this.videoUrl, this.title, this.name, this.profileImg, this.likes, this.comments, this.shares});
  factory PinkVillaModel.fromJson(Map<String, dynamic> map){
    return PinkVillaModel(
      videoUrl : map['url'].toString(),
      title : map['title'].toString(),
      name : map['user']['name'].toString(),
      profileImg : map['user']['headshot'].toString(),
      likes : map['like-count'].toString(),
      comments : map['comment-count'].toString(),
      shares : map['share-count'].toString(),
    );
  }



}
