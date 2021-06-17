import 'package:flutter/foundation.dart';
import 'package:mymusic1/Models/SubDataModel.dart';

enum thrConnectCheck{
  ERROR,
  OK,
  TIMEOUT,
  LOAD,
}

class thrConnectData{
  SubDataModel subDataModel;
  thrConnectCheck check;
  thrConnectData({@required this.subDataModel, @required this.check});
}

