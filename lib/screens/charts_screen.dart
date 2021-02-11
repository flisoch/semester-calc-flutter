import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';

class ChartsScreen extends StatefulWidget {
  final bool isLoading;
  final Stats stats;
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  const ChartsScreen(
      {Key key,
      this.isLoading,
      this.stats,
      this.subjects,
      this.chosenElectives})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChartsWidgetState(
      isLoading: isLoading,
      chosenElectives: chosenElectives,
      subjects: subjects,
      stats: stats,
    );
  }
}

class _ChartsWidgetState extends State<ChartsScreen> {
  final bool isLoading;
  final Stats stats;
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  num selfStudyHours = 20;
  num studyHours = 40;
  List<bool> checkboxes = <bool>[true, false, false, true, true, false];

  _ChartsWidgetState(
      {this.isLoading, this.stats, this.subjects, this.chosenElectives});

  @override
  Widget build(BuildContext context) {
    List<Subject> notElectives = getNotElectives(subjects);
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(top: 10.0),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                        'Количество пар',
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
                                    return 'Пн';
                                  case 1:
                                    return 'Вт';
                                  case 2:
                                    return 'Ср';
                                  case 3:
                                    return 'Чт';
                                  case 4:
                                    return 'Пт';
                                  case 5:
                                    return 'Сб';
                                  case 6:
                                    return 'Вс';
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
              percent: 1.0 -
                  stats.selfStudyHoursPerWeek /
                      (stats.hoursPerWeek + stats.selfStudyHoursPerWeek),
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        '${stats.selfStudyHoursPerWeek + stats.hoursPerWeek} ч',
                        style: TextStyle(fontSize: 36),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          new Text(
                            '${stats.selfStudyHoursPerWeek} ч',
                            style: TextStyle(fontSize: 12),
                          ),
                          new Text(
                            'самостоятельно',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
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
          child: ListView.builder(
              itemCount: notElectives.length + chosenElectives.length,
              itemBuilder: (context, index) {
                if (index >= notElectives.length) {
                  // build electives
                  num idx = index - notElectives.length;
                  num chosenIndex = chosenElectives.keys.elementAt(idx);
                  return Column(
                    children: [
                      CheckboxListTile(
                          title: Text('${chosenElectives[chosenIndex].name}'),
                          value: checkboxes[idx],
                          onChanged: (bool value) {
                            setState(() {
                              checkboxes[idx] = value;
                            });
                          },
                          secondary: const Icon(Icons.school)),
                      CheckboxListTile(
                        activeColor: Colors.lightBlue,
                        title: const Text('Самостоятельное обучение'),
                        value: checkboxes[idx + 1],
                        onChanged: (bool value) {
                          setState(() {
                            checkboxes[idx + 1] = value;
                          });
                        },
                        secondary: const Icon(Icons.home_work_outlined),
                      ),
                    ],
                  );
                } else {
                  // build not electives
                  return Column(
                    children: [
                      CheckboxListTile(
                          title: Text('${notElectives[index].name}'),
                          value: checkboxes[index],
                          onChanged: (bool value) {
                            setState(() {
                              checkboxes[index] = value;
                            });
                          },
                          secondary: const Icon(Icons.school)),
                      CheckboxListTile(
                        activeColor: Colors.lightBlue,
                        title: const Text('Самостоятельное обучение'),
                        value: checkboxes[index],
                        onChanged: (bool value) {
                          setState(() {
                            checkboxes[index] = value;
                          });
                        },
                        secondary: const Icon(Icons.home_work_outlined),
                      ),
                    ],
                  );
                }
              }))
    ]);
  }

  List<Subject> getNotElectives(List<Subject> subjects) {
    return subjects.where((element) => !element.elective).toList();
  }
}
