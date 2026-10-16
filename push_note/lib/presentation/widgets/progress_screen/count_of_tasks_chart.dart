import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:material_ui/material_ui.dart';
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
          const UniversalCluster(
              padding: 0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: BarChartSample7(),
              )),
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
        case 4:
          orangeCount++;
        case 3:
          yellowCount++;
        case 2:
          greenCount++;
        case 1:
          blueCount++;
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
          print('notes: ${notes.length} interval: ${notes.length ~/ 10}');
          final defaultInterval = notes.length ~/ 10;
          final interval = (defaultInterval == 0 ? 1 : defaultInterval).toDouble();
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
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    interval: interval,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
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
                horizontalInterval: interval,
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
