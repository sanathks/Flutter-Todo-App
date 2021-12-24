import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;

  const Label( {required this.text });

  @override
  Widget build(BuildContext context) {
     return Text(text);
  }
}
