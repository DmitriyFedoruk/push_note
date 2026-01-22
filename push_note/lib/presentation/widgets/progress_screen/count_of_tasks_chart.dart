import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class CountOfTasksChart extends StatelessWidget {
  const CountOfTasksChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UniversalCluster(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                t.countByAllTime,
                style: RobotoTextStyle.middle,
              ),
            ),
          ),
          const SizedBox(height: 24),
          UniversalCluster(child: BarChartSample7()),
        ],
      ),
    );
  }
}

class BarChartSample7 extends StatefulWidget {
  BarChartSample7({super.key});

  final dataList = [
    const _BarData(NoteColors.red, 18),
    const _BarData(NoteColors.orange, 17),
    const _BarData(NoteColors.yellow, 10),
    const _BarData(NoteColors.green, 2.5),
    const _BarData(NoteColors.blue, 2),
    const _BarData(Colors.grey, 2),
  ];

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  int rotationTurns = 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          rotationQuarterTurns: rotationTurns,
          borderData: FlBorderData(
            show: true,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey.withValues(alpha: 0.2),
              ),
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: const AxisTitles(
              drawBelowEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  return SideTitleWidget(
                    meta: meta,
                    child: _IconWidget(
                      color: widget.dataList[index].color,
                      isSelected: touchedGroupIndex == index,
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withValues(alpha: 0.2),
              strokeWidth: 1,
            ),
          ),
          barGroups: widget.dataList.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;
            return generateBarGroup(
              index,
              data.color,
              data.value,
            );
          }).toList(),
          maxY: 20,
          barTouchData: BarTouchData(
            enabled: true,
            handleBuiltInTouches: false,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.transparent,
              tooltipMargin: 0,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.toY.toString(),
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: rod.color,
                    fontSize: 18,
                    shadows: const [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 12,
                      )
                    ],
                  ),
                );
              },
            ),
            touchCallback: (event, response) {
              if (event.isInterestedForInteractions && response != null && response.spot != null) {
                setState(() {
                  touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                });
              } else {
                setState(() {
                  touchedGroupIndex = -1;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(
    this.color,
    this.value,
  );

  final Color color;
  final double value;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaledByDouble(scale, scale, scale, 1.0),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
