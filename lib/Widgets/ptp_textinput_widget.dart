// import 'package:flutter/material.dart';
//
// class PTPTextInputWidget extends StatelessWidget {
//   final TextEditingController? textEditingController;
//   final String hintText;
//   final Color? fillCOlor;
//   final Color? textCOlor;
//   final Color? hintCOlor;
//   final Widget? icon;
//
//   final Function(String)? onchage;
//   const PTPTextInputWidget({super.key, this.textEditingController, required this.hintText,
//   this.icon, this.onchage, this.fillCOlor, this.textCOlor, this.hintCOlor});
//
//   @override
//   Widget build(BuildContext context) {
//     return  TextFormField(
//       controller:  textEditingController,
//         onChanged: onchage,
//         cursorColor: Colors.black,
//         style:  TextStyle(color: textCOlor ?? Colors.black, fontWeight: FontWeight.normal, fontFamily: 'gil'),
//               decoration: InputDecoration(
//                 // contentPadding: const EdgeInsets.all(2),
//                 fillColor: fillCOlor?? Colors.grey.withOpacity(0.2),
//                 filled: true,
//                 hintText: hintText,
//                 hintStyle: TextStyle(color: hintCOlor ?? Colors.black,  fontFamily: 'gilly' , fontSize:  ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide.none
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide.none
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide.none
//                 ),
//                 prefixIcon: icon
//               ),
//             );
//   }
// }
import 'package:flutter/material.dart';

class PTPTextInputWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final Color? fillCOlor;
  final Color? textCOlor;
  final Color? hintCOlor;
  final Widget? icon;
  final Function(String)? onchage;
  final double? fontSize;
  final FontWeight? fontWeight;

  const PTPTextInputWidget({
    super.key,
    this.textEditingController,
    this.hintText,
    this.icon,
    this.onchage,
    this.fillCOlor,
    this.textCOlor,
    this.hintCOlor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onchage,
      cursorColor: Colors.black,
      style: TextStyle(
          color: textCOlor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 14.0,
          fontFamily: 'gil'
      ),
      decoration: InputDecoration(
        fillColor: fillCOlor ?? Colors.grey.withOpacity(0.2),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintCOlor ?? Colors.black,
          fontFamily: 'gilly',
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
        ),
        prefixIcon: icon,
      ),
    );
  }
}
