import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
import 'package:provider/provider.dart';

class PatientHistoryChart extends StatefulWidget {
  final int day;
  const PatientHistoryChart({super.key, required this.day});

  @override
  State<PatientHistoryChart> createState() => _PatientHistoryChartState();
}

class _PatientHistoryChartState extends State<PatientHistoryChart> {
  List<Color> gradientColors = [
    Color(0xffFF7979),
    Color(0xffFF7979),
  ];

  Timer? timer;

  void initTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // dos :)
      //job
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool showAvg = false;

  List<FlSpot> getSpots(int lastNDays) {
    List<FlSpot> spotList = [];
    double spotNum = 0;
    final now = DateTime.now();
    final lastWeek = now.subtract(Duration(days: lastNDays));
    List<Map<String, dynamic>> history =
        context.watch<HeartRateProvider>().history;
    var result = history
        .where((item) {
          final timestamp = item['timestamp'] as Timestamp?;
          if (timestamp == null) {
            return false;
          }
          final timestampDateTime = timestamp.toDate();
          return timestampDateTime.isAfter(lastWeek);
        })
        .map((item) => item['bpm'] as int)
        .toList();
    List<double> doubleResult =
        result.map((int value) => value.toDouble()).toList();
    for (var element in doubleResult) {
      spotList.add(FlSpot(spotNum, element));
      spotNum++;
    }
    return spotList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                mainData(widget.day),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 40,
            child: Text(
              'PPM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff0096D1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff0096D1));
    Widget text;
    switch (value.toInt()) {
      case 5:
        text = Text(
            context.watch<HeartRateProvider>().last10Dates[0].toString(),
            style: style);
        break;
      case 15:
        text = Text(
            context.watch<HeartRateProvider>().last10Dates[1].toString(),
            style: style);
        break;
      case 25:
        text = Text(
            context.watch<HeartRateProvider>().last10Dates[2].toString(),
            style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff0096D1));
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 100:
        text = '100';
        break;
      case 200:
        text = '200';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(int days) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 100,
        verticalInterval: 30,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff0096D1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff0096D1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
            bottom: BorderSide(color: const Color(0xff0096D1), width: 1)),
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 210,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(days),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
