import 'dart:ui';

import 'package:flutter/material.dart';

class PTPSecondaryButtonWIdget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final Function()? ontap;
  const PTPSecondaryButtonWIdget(
      {super.key, required this.child, this.height, this.width, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: GestureDetector(
          onTap: ontap,
          child: Container(
              height: height ?? 40,
              width: width ?? MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white.withOpacity(0.5)),
              child: child),
        ),
      ),
    );
  }
}
