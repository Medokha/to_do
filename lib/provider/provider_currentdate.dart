import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class providercurrentdate extends ChangeNotifier{
  DateTime currentdate =DateTime.now();

  void changedate (DateTime date){
    currentdate=date;
    notifyListeners();
  }
}