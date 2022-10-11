import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LabelInput extends StatelessWidget {
  const LabelInput({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontFamily: 'Poppin',
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
