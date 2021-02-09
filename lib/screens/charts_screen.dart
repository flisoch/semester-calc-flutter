import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChartsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<ChartsScreen> {
  num selfStudyHours = 20;
  num studyHours = 40;
  List<bool> checkboxes = <bool>[true, false, false, true, true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: const Color(0xff2c4260),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(child: Icon(Icons.bar_chart)),
                        const SizedBox(
                          width: 38,
                        ),
                        const Text(
                          'Classes count',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 5,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Color(0xff7589a2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                margin: 20,
                                getTitles: (double value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return 'Mo';
                                    case 1:
                                      return 'Tu';
                                    case 2:
                                      return 'We';
                                    case 3:
                                      return 'Th';
                                    case 4:
                                      return 'Fr';
                                    case 5:
                                      return 'Sa';
                                    case 6:
                                      return 'Su';
                                    default:
                                      return '';
                                  }
                                },
                              ),
                              leftTitles: SideTitles(showTitles: false),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: [
                              BarChartGroupData(
                                x: 0,
                                barRods: [
                                  BarChartRodData(y: 2, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 1,
                                barRods: [
                                  BarChartRodData(y: 3, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 2,
                                barRods: [
                                  BarChartRodData(y: 0.0001, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 3,
                                barRods: [
                                  BarChartRodData(y: 2, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 4,
                                barRods: [
                                  BarChartRodData(y: 2, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                              BarChartGroupData(
                                x: 5,
                                barRods: [
                                  BarChartRodData(y: 0.0001, colors: [
                                    Colors.lightBlueAccent,
                                    Colors.greenAccent
                                  ])
                                ],
                                showingTooltipIndicators: [0],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 3 / 1.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 18.0,
                percent: 1.0 - selfStudyHours / studyHours,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          '$studyHours h',
                          style: TextStyle(fontSize: 36),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          '$selfStudyHours h self-study',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                backgroundColor: Colors.lightBlueAccent,
                progressColor: Colors.green,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              CheckboxListTile(
                title: const Text('Дисциплина по выбору'),
                value: checkboxes[0],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[0] = value;
                  });
                },
                secondary: const Icon(Icons.school),
              ),
              CheckboxListTile(
                activeColor: Colors.lightBlue,
                title: const Text('Self-study'),
                value: checkboxes[1],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[1] = value;
                  });
                },
                secondary: const Icon(Icons.home_work_outlined),
              ),
              CheckboxListTile(
                title: const Text('Методология научных исследований'),
                value: checkboxes[2],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[2] = value;
                  });
                },
                secondary: const Icon(Icons.school),
              ),
              CheckboxListTile(
                activeColor: Colors.lightBlue,
                title: const Text('Self-study'),
                value: checkboxes[3],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[3] = value;
                  });
                },
                secondary: const Icon(Icons.home_work_outlined),
              ),
              CheckboxListTile(
                title: const Text('Основы информационного поиска'),
                value: checkboxes[4],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[4] = value;
                  });
                },
                secondary: const Icon(Icons.school),
              ),
              CheckboxListTile(
                activeColor: Colors.lightBlue,
                title: const Text('Self-study'),
                value: checkboxes[5],
                onChanged: (bool value) {
                  setState(() {
                    checkboxes[5] = value;
                  });
                },
                secondary: const Icon(Icons.home_work_outlined),
              ),

            ],
          ),
        )
      ],
    );
  }
}

