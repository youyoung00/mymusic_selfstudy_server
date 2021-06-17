import 'package:flutter/foundation.dart';
import 'package:mymusic1/Models/MainDataModels.dart';

enum SubConnectCheck{
  Error,
  Load,
  OK,
  ServerTimeOut,
}

class SubConnectData{
  MainDataModel mainDataModel;
  SubConnectCheck check;
  SubConnectData({@required this.mainDataModel,@required this.check});
}