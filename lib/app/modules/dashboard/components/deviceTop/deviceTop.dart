// import 'dart:ui';

// import 'package:get/get.dart';
import 'package:aiot/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class DeviceTop extends StatelessWidget {
  final DashboardController c = Get.find();
  List deviceName = [];
  List<BarChartGroupData> deviceNum = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                right: 12.0, left: 12.0, top: 78, bottom: 12),
            child: Obx(
              () => c.deviceTop.length > 0
                  ? BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        minY: 0,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipBottomMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          // 定义x，y轴的标题
                          show: true,
                          bottomTitles: SideTitles(
                            // x轴标题
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                              color: Color(0xff68737d),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            margin: 20,
                            getTitles: (value) {
                              return c.deviceTop[value.toInt()].deviceName;
                            },
                          ),
                          leftTitles: SideTitles(
                            // 不显示y轴标题
                            showTitles: false,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: c.deviceTop.asMap().keys.map((index) {
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                  y: c.deviceTop[index].deviceNum.toDouble(),
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                            ],
                            showingTooltipIndicators: [0],
                          );
                        }).toList(),
                      ),
                    )
                  : Center(
                      child: Text('暂无数据'),
                    ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 34.0,
            child: Text(
              '设备接入Top5',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
                decoration: TextDecoration.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
