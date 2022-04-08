// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class MyButton extends StatelessWidget {
  @SemanticsHintOverrides()
  final Color color;
  final String text;
  final VoidCallback? onPress;

  const MyButton(
      {required this.color, required this.text, required this.onPress})
      : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      textColor: Colors.white,
      color: color,
      child: Text(text),
    );
  }
}
