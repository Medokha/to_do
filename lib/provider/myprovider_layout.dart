import 'package:flutter/cupertino.dart';

class providerlayout extends ChangeNotifier{
  int curentindex =0;
  void changetab (index){
    curentindex =index;
    notifyListeners();
  }
}