import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
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
          const UniversalCluster(child: BarChartSample7()),
        ],
      ),
    );
  }
}

class BarChartSample7 extends StatefulWidget {
  const BarChartSample7({super.key});

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  List<_BarData> dataList = [];
  int maxCount = 0;

  void generateDataList(List<Note> notes) {
    int redCount = 0;
    int orangeCount = 0;
    int yellowCount = 0;
    int greenCount = 0;
    int blueCount = 0;
    int emptyTypeCount = 0;
    for (var n in notes) {
      switch (n.priority) {
        case 5:
          redCount++;
          break;
        case 4:
          orangeCount++;
          break;
        case 3:
          yellowCount++;
          break;
        case 2:
          greenCount++;
          break;
        case 1:
          blueCount++;
          break;
        default:
          emptyTypeCount++;
      }
    }
    final list = [redCount, orangeCount, yellowCount, greenCount, blueCount, emptyTypeCount];
    maxCount = list.reduce(max);

    dataList = [
      _BarData(
        NotesColorsEnum.red,
        redCount,
      ),
      _BarData(NotesColorsEnum.orange, orangeCount),
      _BarData(NotesColorsEnum.yellow, yellowCount),
      _BarData(NotesColorsEnum.green, greenCount),
      _BarData(NotesColorsEnum.blue, blueCount),
      _BarData(null, emptyTypeCount),
    ];
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Selector<NotesProvider, List<Note>>(
        selector: (_, state) => state.notes,
        builder: (context, notes, child) {
          generateDataList(notes);
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              borderData: FlBorderData(
                show: true,
                border: const Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.grey,
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
                    interval: 1,
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
                          type: dataList[index].type,
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
                horizontalInterval: 1,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withValues(alpha: 0.2),
                  strokeWidth: 1,
                ),
              ),
              barGroups: dataList.asMap().entries.map((e) {
                final index = e.key;
                final data = e.value;
                return generateBarGroup(
                  index,
                  data.type?.color ?? AppColors.grey,
                  data.value,
                );
              }).toList(),
              maxY: maxCount + 2.0,
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
          );
        },
      ),
    );
  }

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    int value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value.toDouble(),
          color: color,
          width: 12,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }
}

class _BarData {
  const _BarData(
    this.type,
    this.value,
  );

  final NotesColorsEnum? type;
  final int value;
}

class _IconWidget extends StatelessWidget {
  final NotesColorsEnum? type;
  const _IconWidget({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getImage(type),
      width: 30,
      height: 30,
    );
  }
}
