import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class providersettings extends ChangeNotifier{
  String dropdownvalue = 'en';
  void changevalue (String value){
    dropdownvalue=value;
    notifyListeners();
  }
  ThemeMode dropdownvalue2 = ThemeMode.light;
  void changevaluemode (ThemeMode value){
    dropdownvalue2=value ;
    notifyListeners();
  }

}