import 'package:flutter/cupertino.dart';

class providerisdone extends ChangeNotifier{
  String done ='false';
  void changedone(String newdone){
    done = newdone;
    notifyListeners();
  }
}