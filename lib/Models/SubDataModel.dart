import 'package:flutter/material.dart';

class SubDataModel{
  String title;
  String jacket;
  String artist;
  String lyrics;

  SubDataModel({
    @required this.lyrics,
    @required this.jacket,
    @required this.title,
    @required this.artist
 });

  SubDataModel.init(Map<String,dynamic> v){
    this.lyrics = v["lyrics"].toString();
    this.jacket = v["jacket"].toString();
    this.artist = v["artist"].toString();
    this.title = v["title"].toString();
  }

  factory SubDataModel.fInit(Map<String,dynamic> v){
    return new SubDataModel.init(v);
  }
}
