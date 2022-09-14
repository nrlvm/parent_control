import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parent_control/src/colors/app_color.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeChartWidget extends StatelessWidget {
  final List<double> taskCount;

  const HomeChartWidget({
    Key? key,
    required this.taskCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    // ignore: unused_local_variable
    final List<Color> gradient = [
      Colors.red,
      Colors.orange,
      Colors.pinkAccent,
      Colors.purpleAccent,
      Colors.green,
      Colors.blue,
      Colors.indigoAccent,
      Colors.tealAccent,
      Colors.green,
    ];
    return Container(
      height: 104 * h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 35 * w),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            show: false,
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              // dashArray: [20, 20],
              // isCurved: true,
              spots: [
                FlSpot(0, taskCount[0]),
                FlSpot(1, taskCount[1]),
                FlSpot(2, taskCount[2]),
                FlSpot(3, taskCount[3]),
                FlSpot(4, taskCount[4]),
                FlSpot(5, taskCount[5]),
                FlSpot(6, taskCount[6]),
              ],
              color: AppColor.dark,
              // gradient: LinearGradient(colors: gradient),
              barWidth: 1,
              // belowBarData: BarAreaData(
              //   show: true,
              //   gradient: LinearGradient(
              //       colors: gradient
              //           .map((color) => color.withOpacity(0.3))
              //           .toList()),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
