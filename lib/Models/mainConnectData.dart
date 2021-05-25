import 'package:flutter/foundation.dart';
import 'package:mymusic1/Models/MainDataModels.dart';

class MainConnectData{
  List<MainDataModel> data;
  String viewTxt;
  MainConnectData({
    @required this.data,
    @required this.viewTxt
  });
}