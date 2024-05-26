import 'package:flutter/material.dart';

class PTPTextWidget extends StatelessWidget {
  final String text;
  final String? family;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  const PTPTextWidget({super.key, required this.text, this.color, this.fontsize, this.fontWeight, this.family});

  @override
  Widget build(BuildContext context) {
    return Text(text, 
    style: TextStyle(color: color ?? Colors.black, 
    fontFamily: family ?? 'gil',  fontSize: fontsize?? 17, fontWeight:fontWeight ?? FontWeight.bold),);
  }
}