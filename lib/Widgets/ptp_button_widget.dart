import 'package:flutter/material.dart';

class PTPButtonWidget extends StatelessWidget {
  final Size? size;
  final Color? bgCOlor;
  final Function()? ontap;
  final Widget child;
  const PTPButtonWidget({super.key, this.size, this.bgCOlor, this.ontap, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ontap,
        style: ElevatedButton.styleFrom(
          fixedSize: size?? const Size(double.infinity, 28),
          backgroundColor:bgCOlor ?? const Color(0xff036A41),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ), 
        child: child,
    );
  }
}