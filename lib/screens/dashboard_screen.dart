import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "6",
                              style:
                                  TextStyle(fontSize: 100, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Предметов",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "12",
                                  style: TextStyle(
                                      fontSize: 100, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "Пар в неделю",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    // color: Colors.green,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              style:
                                  TextStyle(fontSize: 100, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Экзамена",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "18",
                                  style: TextStyle(
                                      fontSize: 100, color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    "ч",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "Недельной нагрузки",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    // color: Colors.green,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              style:
                                  TextStyle(fontSize: 100, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Зачёта",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.green,
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.green),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                      fontSize: 100, color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    "ч",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "Рекомендуемой нагрузки",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
