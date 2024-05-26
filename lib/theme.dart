import 'dart:math';

import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff036A41);
const Color bgPrimary = Color(0xffEAEAEA);
const Color bg = Color(0xffF6F6F6);
const Color secondaryBg = Color(0xff161415);
const Color secondaryUI = Color.fromARGB(238, 227, 227, 227);




Color generateRandomColor1() {
  // Define all colors you want here
  const predefinedColors = [
    Color(0xffF4F0ED),
Color(0xffD9D9D9), 
  Color(0xffEDEEF4),
   Color(0xffF3F2EB)
  ];
  Random random = Random();
  return predefinedColors[random.nextInt(predefinedColors.length)];
}