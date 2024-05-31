import 'dart:async';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// El widget [HeartLine] muestra un gráfico de línea.
class HeartLine extends StatefulWidget {
  const HeartLine({super.key});

  final Color sinColor = Colors.blue;
  final Color cosColor = Colors.red;

  @override
  State<HeartLine> createState() => _HeartLineState();
}

class _HeartLineState extends State<HeartLine> {
  final limitCount = 100;
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      while (sinPoints.length > limitCount) {
        sinPoints.removeAt(0);
        cosPoints.removeAt(0);
      }
      setState(() {
        sinPoints.add(FlSpot(xValue, math.sin(xValue)));
        cosPoints.add(FlSpot(xValue, math.cos(xValue)));
      });
      xValue += step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return cosPoints.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 5,
                  child: LineChart(
                    LineChartData(
                      minY: -1.1,
                      maxY: 1.1,
                      minX: sinPoints.first.x + 1.5,
                      maxX: sinPoints.last.x,
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData.all(),
                      gridData: const FlGridData(
                        show: true,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        cosLine(cosPoints),
                      ],
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [widget.sinColor.withOpacity(0), widget.sinColor],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [widget.cosColor.withOpacity(0), widget.cosColor],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
