import 'package:flutter/foundation.dart';
import 'package:mymusic1/logic/Connect.dart';
import 'package:mymusic1/logic/mainConnectData.dart';

class MainProvider with ChangeNotifier{
  Connect _connect = new Connect();
  MainConnectData data;

  Future<void>_init() async{
    this.data = await this._connect.mainConnect(data);
    notifyListeners();
    return;
  }

  MainProvider(){
    Future(this._init);
    // Future( () async => await this._init()); 위와 동일한 코드.
  }

}