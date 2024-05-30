import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heart_at_time/src/providers/heart_rate_provider.dart';
import 'package:provider/provider.dart';

class HistoryChart extends StatefulWidget {
  const HistoryChart({super.key});

  @override
  State<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends State<HistoryChart> {
  List<Color> gradientColors = [
    Color(0xffFF7979),
    Color(0xffFF7979),
  ];

  bool showAvg = false;

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
                mainData(),
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

  LineChartData mainData() {
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
          spots: [
            FlSpot(0, context.watch<HeartRateProvider>().last10[0].toDouble()),
            FlSpot(1, context.watch<HeartRateProvider>().last10[1].toDouble()),
            FlSpot(2, context.watch<HeartRateProvider>().last10[2].toDouble()),
            FlSpot(3, context.watch<HeartRateProvider>().last10[3].toDouble()),
            FlSpot(4, context.watch<HeartRateProvider>().last10[4].toDouble()),
            FlSpot(5, context.watch<HeartRateProvider>().last10[5].toDouble()),
            FlSpot(6, context.watch<HeartRateProvider>().last10[6].toDouble()),
            FlSpot(7, context.watch<HeartRateProvider>().last10[7].toDouble()),
            FlSpot(8, context.watch<HeartRateProvider>().last10[8].toDouble()),
            FlSpot(9, context.watch<HeartRateProvider>().last10[9].toDouble()),
            FlSpot(
                10, context.watch<HeartRateProvider>().last10[10].toDouble()),
            FlSpot(
                11, context.watch<HeartRateProvider>().last10[11].toDouble()),
            FlSpot(
                12, context.watch<HeartRateProvider>().last10[12].toDouble()),
            FlSpot(
                13, context.watch<HeartRateProvider>().last10[13].toDouble()),
            FlSpot(
                14, context.watch<HeartRateProvider>().last10[14].toDouble()),
            FlSpot(
                15, context.watch<HeartRateProvider>().last10[15].toDouble()),
            FlSpot(
                16, context.watch<HeartRateProvider>().last10[16].toDouble()),
            FlSpot(
                17, context.watch<HeartRateProvider>().last10[17].toDouble()),
            FlSpot(
                18, context.watch<HeartRateProvider>().last10[18].toDouble()),
            FlSpot(
                19, context.watch<HeartRateProvider>().last10[19].toDouble()),
            FlSpot(
                20, context.watch<HeartRateProvider>().last10[20].toDouble()),
            FlSpot(
                21, context.watch<HeartRateProvider>().last10[21].toDouble()),
            FlSpot(
                22, context.watch<HeartRateProvider>().last10[22].toDouble()),
            FlSpot(
                23, context.watch<HeartRateProvider>().last10[23].toDouble()),
            FlSpot(
                24, context.watch<HeartRateProvider>().last10[24].toDouble()),
            FlSpot(
                25, context.watch<HeartRateProvider>().last10[25].toDouble()),
            FlSpot(
                26, context.watch<HeartRateProvider>().last10[26].toDouble()),
            FlSpot(
                27, context.watch<HeartRateProvider>().last10[27].toDouble()),
            FlSpot(
                28, context.watch<HeartRateProvider>().last10[28].toDouble()),
            FlSpot(
                29, context.watch<HeartRateProvider>().last10[29].toDouble()),
          ],
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
