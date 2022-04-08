// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer_04/model/count.dart';
import 'package:timer_04/stream/count_stream.dart';
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
  Count count = Count('0', 1.0);
  final countStream = CountStream();

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
                            countStream.setTime(30);
                            countStream.start();
                            setTextoLabel(0);
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
                            countStream.setTime(60);
                            countStream.start();
                            setTextoLabel(0);
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
                            countStream.setTime(120);
                            countStream.start();
                            setTextoLabel(0);
                          },
                          text: "2 minutos"),
                    ),
                  ],
                ),
                Expanded(
                    child: StreamBuilder(
                  initialData: count,
                  stream: countStream.stream(),
                  builder: (_, AsyncSnapshot snapshot) {
                    print("en el streambuilder");
                    print(snapshot);

                    if (snapshot.hasData) {
                      print("hay data");
                      print(snapshot.data);
                      //return CircularProgressIndicator();
                    }
                    return Indicador(
                        count: snapshot.hasData ? snapshot.data : count);
                  },
                )),
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF7B1FA2),
                          onPress: startStop,
                          text: textoLabel),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyButton(
                          color: Color(0xFF212121),
                          onPress: reiniciar,
                          text: "Reiniciar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  startStop() {
    if (countStream.getActive()) {
      setState(() {
        setTextoLabel(1);
      });
      countStream.stop();
    } else {
      setState(() {
        setTextoLabel(0);
      });
      countStream.start();
    }
  }

  reiniciar() {
    countStream.restart();
    countStream.start();
  }

  setTextoLabel(int estado) {
    if (estado == 0) {
      setState(() {
        textoLabel = "Pausar";
      });
    } else {
      setState(() {
        textoLabel = "Iniciar";
      });
    }
  }
}
