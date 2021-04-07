import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stainless_v2/generated/l10n.dart';
import 'package:stainless_v2/utils/_export.dart';
import 'dart:math';

class Chart extends StatelessWidget {
  final List<double> monthSales;

  Chart({Key key, this.monthSales}) : super(key: key);

  final List<Color> gradientColors = [
    Color(0xff0A9FDE),
    Color(0xff81ECEC),
  ];
  List<String> months = [
    S.current.Jan,
    S.current.Feb,
    S.current.Mar,
    S.current.Apr,
    S.current.May,
    S.current.Jan,
    S.current.Jul,
    S.current.Aug,
    S.current.Sep,
    S.current.Oct,
    S.current.Nov,
    S.current.Dec,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        delay: const Duration(milliseconds: 300),
        verticalOffset: 200.h,
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey[200],
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey[200],
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.bold,
                fontSize: 8),
            getTitles: (value) {
              return months[value.toInt()];
            },
            margin: 8),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            if (monthSales.reduce(max).toInt() == value) return "$value K";
            return "";
          },
          reservedSize: 28,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: monthSales.reduce(max),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
              12, (index) => FlSpot(index.toDouble(), monthSales[index])),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
