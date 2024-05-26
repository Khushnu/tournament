import 'package:flutter/material.dart';
import 'package:paddle_tournment_pro/theme.dart';

bottomSheet(BuildContext context, bool isScrolled, Widget child){
  return                                                         
showModalBottomSheet(
  backgroundColor: secondaryBg,
  isScrollControlled: isScrolled,
  context: context,
  builder: (BuildContext context) {
    return child;
  },
);
}