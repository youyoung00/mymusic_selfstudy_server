import 'package:flutter/foundation.dart';
import 'package:mymusic1/Models/SubDataModel.dart';

class MainDataModel{

  String category;
  String categoryimg;
  List<SubDataModel> datas;

  MainDataModel({
    @required this.category,
    @required this.categoryimg,
    @required this.datas
 });

  MainDataModel.init(Map<String,dynamic> e){
    this.categoryimg = e["categoryimg"].toString();
    this.category = e["category"].toString();
    this.datas = new List.from(e["datas"]).map<SubDataModel>((dynamic v){
      return SubDataModel.init(v);
    }).toList();
  }

  factory MainDataModel.fInit(Map<String,dynamic> e){
    return MainDataModel.init(e);
    // return new MainDataModel(
    //   categoryimg: e["categoryimg"].toString(),
    //   category: e["category"].toString(),
    //   datas: new List.from(e["datas"]).map<SubDataModel>((v){
    //     return new SubDataModel.init(v);}).toList()
    // );
  }
}