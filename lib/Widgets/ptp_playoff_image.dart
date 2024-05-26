import 'package:flutter/material.dart';
import 'package:paddle_tournment_pro/Widgets/text_widget.dart';
import 'package:paddle_tournment_pro/theme.dart';

class PTPPlayOffImageWidget extends StatelessWidget {
  const PTPPlayOffImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                                          height: MediaQuery.sizeOf(context).height *0.1 - 14,
                                          width: MediaQuery.sizeOf(context).width *0.3,
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            // color: Colors.amber,
                                            image: DecorationImage(image: AssetImage('assets/rectfinals.png'))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 20, 
                                                width: double.infinity,
                                               decoration: BoxDecoration(
                                                 color: primaryColor,
                                                 borderRadius: BorderRadius.circular(3)
                                               ),
                                               child: const Center(child:  PTPTextWidget(text: 'Carl & Ron', 
                                               color: Colors.white,
                                               fontsize: 10,),),
                                              ), 
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 20, 
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 borderRadius: BorderRadius.circular(3)
                                               ),
                                               child:  Center(child:  PTPTextWidget(text: 'Carl & Ron', 
                                               color: Colors.black.withOpacity(0.4),
                                               fontsize: 10,),),
                                              ), 
                                            ],
                                          ),
                                         );
  }
}