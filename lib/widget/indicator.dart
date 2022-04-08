// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:timer_04/model/count.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Indicador extends StatelessWidget {
  final Count count;

  const Indicador({required this.count}) : super();

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 90.0,
      lineWidth: 8.0,
      percent: count.percent!,
      center: Text("${count.tag!} segundos",
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF9C27B0),
          )),
      progressColor: Color(0xFF9C27B0),
      backgroundColor: Color(0xFFBDBDBD),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
