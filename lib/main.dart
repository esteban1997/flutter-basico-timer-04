// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer_04/model/count.dart';
import 'package:timer_04/widget/indicator.dart';

import 'package:timer_04/widget/my_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Count count = Count('0', 0.0);
  Timer? timer;
  late int stop;
  late int countTime;
  String textoLabel = "Iniciar";

  // This widget is the root of your application.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xFF9C27B0),
              title: const Text("Timer 04")),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF7C4DFF),
                          onPress: () {
                            countTime = 0;
                            stop = 30;
                            start();
                          },
                          text: "30 segundos"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF757575),
                          onPress: () {
                            countTime = 0;
                            stop = 60;
                            start();
                          },
                          text: "1 minuto"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyButton(
                          color: Color(0xFFBDBDBD),
                          onPress: () {
                            countTime = 0;
                            stop = 120;
                            start();
                          },
                          text: "2 minutos"),
                    ),
                  ],
                ),
                Expanded(child: Indicador(count: count)),
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF7B1FA2),
                          onPress: timer == null ? null : startStop,
                          text: textoLabel),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF212121),
                          onPress: timer == null ? null : reiniciar,
                          text: "Reiniciar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  start() {
    textoLabel = "Pausar";
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer.periodic(Duration(seconds: 1), (time) {
      countTime++;
      setState(() {
        count.tag = countTime.toString();
        count.percent = countTime / stop;
      });

      if (countTime >= stop) {
        setState(() {
          textoLabel = "Iniciar";
        });
        time.cancel();
      }
    });
  }

  startStop() {
    if (timer != null) {
      if (timer!.isActive) {
        setState(() {
          textoLabel = "Iniciar";
        });
        timer!.cancel();
      } else {
        start();
      }
    }
  }

  reiniciar() {
    if (timer != null) {
      countTime = 0;
      start();
    }
  }
}
