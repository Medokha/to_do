import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class provideraddtask extends ChangeNotifier{
  DateTime selecttime =DateTime.now();
  void showpiker (BuildContext context) async {
    DateTime? chosendate =await showDatePicker(
        context: context,
        initialDate: selecttime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosendate==null)return;
    selecttime = chosendate;
    notifyListeners();


  }

}