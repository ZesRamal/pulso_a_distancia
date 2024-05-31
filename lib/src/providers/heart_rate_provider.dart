import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

/// [HeartRateProvider] es una clase que maneja y notifica cambios en la frecuencia cardíaca.
/// Utiliza [ChangeNotifier] para notificar a los widgets que dependan de este proveedor cuando hay cambios.
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

  /// Obtiene la frecuencia cardíaca actual.
  int get heartRate => _heartRate;

  /// Establece la frecuencia cardíaca y notifica a los oyentes.
  void setHeartRate(int bpm) {
    _heartRate = bpm;
  }

  /// Obtiene la lista de las últimas 10 lecturas de frecuencia cardíaca.
  List<dynamic> get last10 => _last10;

  /// Actualiza la lista de las últimas 10 lecturas de frecuencia cardíaca y notifica a los oyentes.
  void addToHistory(List<dynamic> last10) {
    if (last10 != _last10) {
      _last10 = last10;
    }
  }

  /// Obtiene la lista de las últimas 10 fechas de las lecturas de frecuencia cardíaca.
  List<dynamic> get last10Dates => _last10Dates;

  /// Actualiza la lista de las últimas 10 fechas de las lecturas de frecuencia cardíaca y notifica a los oyentes
  void addToHistoryTimes(List<dynamic> last10Dates) {
    List<String> hourIntList = last10Dates
        .map((timestamp) => timestampToTimeString(timestamp))
        .toList();
    _last10Dates = [hourIntList[4], hourIntList[14], hourIntList[24]];
  }

  /// Convierte un [Timestamp] de Firestore a [DateTime].
  DateTime timestampToTime(Timestamp timestamp) {
    int seconds = timestamp.seconds;
    int nanoseconds = timestamp.nanoseconds;
    return DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);
  }

  /// Convierte un [Timestamp] de Firestore a una cadena de tiempo en formato HH:mm.
  String timestampToTimeString(Timestamp timestamp) {
    DateTime dateTime = timestampToTime(timestamp);
    return dateTime.hour.toString().padLeft(2, '0') +
        ':' +
        dateTime.minute.toString().padLeft(2, '0');
  }
}
