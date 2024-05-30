import "package:flutter/material.dart";

class HeartRateProvider with ChangeNotifier {
  int _heartRate = 0;

  int get heartRate => _heartRate;

  void setHeartRate(int bpm) {
    _heartRate = bpm;
  }
}
