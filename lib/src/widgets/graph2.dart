import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
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
      case 2:
        text = const Text('10AM', style: style);
        break;
      case 5:
        text = const Text('11AM', style: style);
        break;
      case 8:
        text = const Text('12PM', style: style);
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
        verticalInterval: 10,
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
      maxX: 10,
      minY: 0,
      maxY: 210,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 78),
            FlSpot(1, 80),
            FlSpot(2, 90),
            FlSpot(3, 75),
            FlSpot(4, 84),
            FlSpot(5, 92),
            FlSpot(6, 83),
            FlSpot(7, 91),
            FlSpot(8, 99),
            FlSpot(9, 110),
            FlSpot(10, 125),
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
