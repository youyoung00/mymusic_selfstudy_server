import 'package:flutter/foundation.dart';

class ExProvider with ChangeNotifier{
  int i = 0;

  void add(){
    this.i += 1;
    notifyListeners();
  }
  void minus(){
    this.i -= 1; // this.i = this.i -1;
    notifyListeners();
  }
}