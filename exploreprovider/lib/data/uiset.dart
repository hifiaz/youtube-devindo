import 'package:flutter/foundation.dart';

class UiSet with ChangeNotifier {
  static double _fontsize = 0.5;

  set fontSize(newValue) {
    _fontsize = newValue;
    notifyListeners();
  }

  double get fontSize => _fontsize * 30;
  double get sliderfontSize => _fontsize;
}
