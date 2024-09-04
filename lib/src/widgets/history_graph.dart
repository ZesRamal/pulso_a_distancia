import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
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
            FlSpot(0, 0),
            FlSpot(1, 0),
            FlSpot(2, 0),
            FlSpot(3, 0),
            FlSpot(4, 0),
            FlSpot(5, 0),
            FlSpot(6, 0),
            FlSpot(7, 0),
            FlSpot(8, 0),
            FlSpot(9, 0),
            FlSpot(10, 0),
            FlSpot(11, 0),
            FlSpot(12, 0),
            FlSpot(13, 0),
            FlSpot(14, 0),
            FlSpot(15, 0),
            FlSpot(16, 0),
            FlSpot(17, 0),
            FlSpot(18, 0),
            FlSpot(19, 0),
            FlSpot(20, 0),
            FlSpot(21, 0),
            FlSpot(22, 0),
            FlSpot(23, 0),
            FlSpot(24, 0),
            FlSpot(25, 0),
            FlSpot(26, 0),
            FlSpot(27, 0),
            FlSpot(28, 0),
            FlSpot(29, 0),
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
