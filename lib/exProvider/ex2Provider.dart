import 'package:flutter/foundation.dart';

class Ex2Provider with ChangeNotifier{
  String _value = "안녕하세요";

  String get value => this._value;
  set value(String v){
    this._value = v;
    notifyListeners();
  }

  void add(String txt){
    this.value += txt;
    // this._value = this.-value += txt;
  }
}