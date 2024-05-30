import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class HeartRateProvider with ChangeNotifier {
  int _heartRate = 0;
  List<dynamic> _last10 = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  List<String> _last10Dates = [
    "00:00",
    "00:00",
    "00:00",
  ];

  int get heartRate => _heartRate;

  void setHeartRate(int bpm) {
    _heartRate = bpm;
  }

  List<dynamic> get last10 => _last10;

  void addToHistory(List<dynamic> last10) {
    if (last10 != _last10) {
      _last10 = last10;
    }
  }

  List<dynamic> get last10Dates => _last10Dates;

  void addToHistoryTimes(List<dynamic> last10Dates) {
    List<String> hourIntList = last10Dates
        .map((timestamp) => timestampToTimeString(timestamp))
        .toList();
    _last10Dates = [hourIntList[4], hourIntList[14], hourIntList[24]];
  }

  DateTime timestampToTime(Timestamp timestamp) {
    int seconds = timestamp.seconds;
    int nanoseconds = timestamp.nanoseconds;
    return DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);
  }

  String timestampToTimeString(Timestamp timestamp) {
    DateTime dateTime = timestampToTime(timestamp);
    return dateTime.hour.toString().padLeft(2, '0') +
        ':' +
        dateTime.minute.toString().padLeft(2, '0');
  }
}
