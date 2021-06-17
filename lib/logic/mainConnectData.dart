import 'package:flutter/foundation.dart';
import 'package:mymusic1/Models/MainDataModels.dart';

enum MainConnectCheck{
  Ok,
  Error,
  ServerTimeOut,
  Load,
}

class MainConnectData{
  List<MainDataModel> data;
  //MainDataModel data;
  //String viewTxt;
  MainConnectCheck check;

  MainConnectData({
     @required this.data,
     //@required this.viewTxt,
     @required this.check
    }
  );
}




