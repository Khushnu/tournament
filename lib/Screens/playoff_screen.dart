import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:paddle_tournment_pro/Models/alltournamentmodel.dart';
import 'package:paddle_tournment_pro/Models/playoffmodel.dart';
import 'package:paddle_tournment_pro/Statemanagement/playoffstate.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_bottomsheet_widget.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_playoff_image.dart';
import 'package:paddle_tournment_pro/Widgets/text_widget.dart';
import 'package:paddle_tournment_pro/theme.dart';
import 'package:provider/provider.dart';

class PlayOffScreen extends StatefulWidget {
    final List<AllTournamentModel> e;
  const PlayOffScreen({super.key, required this.e});

  @override
  State<PlayOffScreen> createState() => _PlayOffScreenState();
}

class _PlayOffScreenState extends State<PlayOffScreen> {
  ValueNotifier<int> selectedNumberNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> selectedNumberNotifier2 = ValueNotifier<int>(0);
  // ValueNotifier<LeaderBoardModel> selectedNumberNotifier4 = ValueNotifier<LeaderBoardModel>(LeaderBoardModel('', name:'', points:''));


  var currentRound = listPlayoffModel[0];

 

  @override
  Widget build(BuildContext context) {
    var score1 = context.watch<PlayOffState>().score1;
    var score2 = context.watch<PlayOffState>().score2;

    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector( 
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.1 - 45, 
                    width: MediaQuery.sizeOf(context).width * 0.1 + 12, 
                    decoration: BoxDecoration(
                       color: bgPrimary,
                       borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.1 - 45, 
                  width: MediaQuery.sizeOf(context).width * 0.1 + 12,  
                  decoration: BoxDecoration(
                     color: bgPrimary,
                     borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Icon(Icons.more_vert),
                  ),
                )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: listPlayoffModel.map((e) {
                  bool isSelected = currentRound == e;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentRound = e;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width * 0.2 + 33,
                        decoration: BoxDecoration(
                            color: isSelected ? Colors.black : bgPrimary,
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: PTPTextWidget(
                            text:  e.name,
                            color: isSelected ? Colors.white : Colors.black,
                            fontsize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: MediaQuery.sizeOf(context).width * 0.2- 20,
                    decoration: BoxDecoration(
                        color: bgPrimary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: 35,
                    width: MediaQuery.sizeOf(context).width * 0.2- 20,
                    decoration: BoxDecoration(
                        color: bgPrimary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
             SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                
                  children: List.generate(widget.e.first.listOfCourt.length, 
                  (index) {
                    var c = index == 0 ? 1 : index + 1;
                   var courtnum =  NumberToWordsEnglish.convert(c);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          bottomSheet(context,
                       true,
                        Container(
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                          color: secondaryBg, 
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22))
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const SizedBox(height: 5),
                              const Divider(endIndent: 150, indent: 150, thickness: 2),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: PTPTextWidget(text: 'Playoff Bracket.', 
                                color: Colors.white, fontsize: 30,),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: PTPTextWidget(text: "Advance to the playoffs to crown the tournament champion.", 
                                color: Colors.grey, 
                                fontsize: 16,),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const PTPTextWidget(text: 'Quarter-Finals', color: Colors.white,),
                                          const PTPPlayOffImageWidget(), 
                                          const PTPPlayOffImageWidget(), 
                                          SizedBox(
                                            height: MediaQuery.sizeOf(context).height* 0.1 - 60,
                                          ),
                                          const PTPPlayOffImageWidget(), 
                                          const PTPPlayOffImageWidget(), 
                                         
                                      
                                        ],
                                      ), 
                                      Transform.translate(
                                        offset: const Offset(-6, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 50),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context).height * 0.3,
                                            child: Image.asset('assets/imm.png'),
                                          ),
                                        ),
                                      ), 
                                      Transform.translate(
                                        offset: const Offset(-9,0),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [ 
                                            SizedBox(
                                              height: MediaQuery.sizeOf(context).height * 0.1 - 50,
                                            ),
                                              const PTPTextWidget(text: 'Semi-Finals', color: Colors.white,),
                                            const PTPPlayOffImageWidget(), 
                                            SizedBox(
                                              height: MediaQuery.sizeOf(context).height * 0.1 + 12,
                                            ),
                                            const PTPPlayOffImageWidget(), 
                                          ],
                                        ),
                                      ), 
                                      Transform.translate(
                                        offset: const Offset(-12, 0),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(vertical:  MediaQuery.sizeOf(context).height * 0.1 - 10),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context).height * 0.3 - 50,
                                            child: Image.asset('assets/final.png'),
                                          ),
                                        ),
                                      ), 
                                      Transform.translate(
                                        offset: const Offset(-15, -29),
                                        child: const Align(
                                          alignment: Alignment.centerRight,
                                           child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               PTPTextWidget(text: 'Final', color: Colors.white,),
                                               PTPPlayOffImageWidget(),
                                             ],
                                           )),
                                      )
                                     ],
                                  )
                                  //  Stack(
                                  //   children: [
                                  //     //quarter final visiualize
                                  //     Padding(
                                  //       padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.1- 80, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.1 - 30 ),
                                  //      child: const Align( 
                                  //       alignment: Alignment.topLeft,
                                  //       child: PTPTextWidget(text: 'Quarter-finals', color: Colors.white,)),
                                  //    ),
                                  //    const PTPPlayOffImageWidget(), 
                                  //     Padding(
                                  //       padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.3 , vertical: MediaQuery.sizeOf(context).height * 0.1 - 30),
                                  //       child: SizedBox(
                                  //         //  height: MediaQuery.sizeOf(context).height *0.1 - 34 ,
                                  //         // width: MediaQuery.sizeOf(context).width *0.1,
                                  //         child: Image.asset('assets/imm.png', 
                                  //         fit: BoxFit.contain,)),
                                  //     ), 
                                  //      Positioned( 
                                  //        top: MediaQuery.sizeOf(context).height * 0.1 - 10,
                                  //       left: MediaQuery.sizeOf(context).width * 0.1 - 40 ,
                                  //        child: const PTPPlayOffImageWidget()
                                  //      ), 
                                  //     // Positioned( 
                                  //     //   top: MediaQuery.sizeOf(context).height * 0.1 ,
                                  //     //   left: MediaQuery.sizeOf(context).width * 0.2 + 33,
                                  //     //   child: SizedBox(
                                  //     //      height: MediaQuery.sizeOf(context).height *0.1 - 40,
                                  //     //     width: MediaQuery.sizeOf(context).width *0.1,
                                  //     //     child: Image.asset('assets/line2.png', 
                                  //     //     fit: BoxFit.contain,)),
                                  //     // ), 
                                  //     //second team

                                  //      Positioned(
                                  //      top: MediaQuery.sizeOf(context).height * 0.2 + 40,
                                  //       left: MediaQuery.sizeOf(context).width * 0.1 - 40 ,
                                  //     child: const PTPPlayOffImageWidget()), 
                                  //     //first line 
                                  //     // Positioned( 
                                  //     //   top: MediaQuery.sizeOf(context).height * 0.2 + 90 ,
                                  //     //   left: MediaQuery.sizeOf(context).width * 0.2 + 32 ,
                                  //     //   child: SizedBox(
                                  //     //      height: MediaQuery.sizeOf(context).height *0.1 - 50 ,
                                  //     //     width: MediaQuery.sizeOf(context).width *0.1 - 5,
                                  //     //     child: Image.asset('assets/line1.png', 
                                  //     //     fit: BoxFit.contain,)),
                                  //     // ), 
                                  //     //2ndline
                                  //     // Positioned( 
                                  //     //   top: MediaQuery.sizeOf(context).height * 0.3 + 40 ,
                                  //     //   left: MediaQuery.sizeOf(context).width * 0.2 + 33,
                                  //     //   child: SizedBox(
                                  //     //      height: MediaQuery.sizeOf(context).height *0.1 - 50,
                                  //     //     width: MediaQuery.sizeOf(context).width *0.1-5,
                                  //     //     child: Image.asset('assets/line2.png', 
                                  //     //     fit: BoxFit.contain,)),
                                  //     // ), 
                                  //      Positioned( 
                                  //        top: MediaQuery.sizeOf(context).height * 0.3 + 30 ,
                                  //       left: MediaQuery.sizeOf(context).width * 0.1 - 40 ,
                                  //        child: const PTPPlayOffImageWidget()
                                  //      ), 
                                  //   //Semi Final
                                  //   //top team semi final
                                  //    Padding(
                                  //       padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.1- 50, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.1   ),
                                  //      child: const Align( 
                                  //       alignment: Alignment.topCenter,
                                  //       child: PTPTextWidget(text: 'Semi-finals', color: Colors.white,)),
                                  //    ),
                                  //    Padding(
                                  //        padding:  EdgeInsets.symmetric(vertical: 40, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.3 + 15 ),
                                  //        child: const Align(  
                                  //           alignment: Alignment.topLeft,
                                  //          child: PTPPlayOffImageWidget()
                                  //        ),
                                  //      ), 
                                  //       Positioned( 
                                  //     top: MediaQuery.sizeOf(context).height * 0.1  ,
                                  //       left: MediaQuery.sizeOf(context).width * 0.5 + 45 ,
                                  //     child: SizedBox(
                                  //        height: MediaQuery.sizeOf(context).height *0.1 + 20,
                                  //       width: MediaQuery.sizeOf(context).width *0.1-5,
                                  //       child: Image.asset('assets/linelong1.png', 
                                  //       fit: BoxFit.contain,)),
                                  //   ), 
                                  //   //bottom team
                                  //   Positioned( 
                                  //     top: MediaQuery.sizeOf(context).height * 0.2 + 20 ,
                                  //       left: MediaQuery.sizeOf(context).width * 0.5 + 45 ,
                                  //     child: SizedBox(
                                  //        height: MediaQuery.sizeOf(context).height *0.1 + 20,
                                  //       width: MediaQuery.sizeOf(context).width *0.1-5,
                                  //       child: Image.asset('assets/linelong2.png', 
                                  //       fit: BoxFit.contain,)),
                                  //   ), 
                                  //      Padding(
                                  //        padding:  EdgeInsets.symmetric(vertical: 90, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.3 + 12 ),
                                  //        child: const Align(  
                                  //           alignment: Alignment.bottomLeft,
                                  //          child: PTPPlayOffImageWidget()
                                  //        ),
                                  //      ), 
                                  //    // Final team
                                  //    Padding(
                                  //       padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.2- 35, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.1 + 20 ),
                                  //      child: const Align( 
                                  //       alignment: Alignment.topRight,
                                  //       child: PTPTextWidget(text: 'Final', color: Colors.white,)),
                                  //    ),
                                  //    Padding(
                                  //        padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.2- 35, 
                                  //        horizontal: MediaQuery.sizeOf(context).width * 0.1 - 28 ),
                                  //        child: const Align(  
                                  //           alignment: Alignment.topRight,
                                  //          child: PTPPlayOffImageWidget()
                                  //        ),
                                  //      ), 
                                  //   ],
                                  // ),
                                ),
                              )
                          ],
                        ),
                       ));

                        },
                        child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.2 - 10, 
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage('assets/bg.png'), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(14), 
                            color: generateRandomColor1()
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Center(child: PTPTextWidget(text: 'Court $courtnum', fontsize: 24,)), 
                               SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.1 - 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //team one 1 players
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        1, 
                                      (index) {
                                        // var d = widget.e.first.listOfPlayer[index];
                                    if (widget.e.first.listOfPlayer.isNotEmpty ) {
        return ClipRRect(

          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10, 
              sigmaY: 8
            ),
            child: Container(
              // width: MediaQuery.sizeOf(context).width * 0.3,
             padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
              decoration: BoxDecoration(
                color: bg , 
                borderRadius: BorderRadius.circular(13)
              ),
              child: Center(
                child: PTPTextWidget(
                  fontsize: 14,
                  text: '${widget.e.first.listOfPlayer[0].name} & ${widget.e.first.listOfPlayer[1].name}',
                ),
              ),
            ),
          ),
        );
      } else {
        return const AbsorbPointer();
      }
                                      }), 
                                    
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                       height: MediaQuery.sizeOf(context).height * 0.1 - 20,
                                      width: MediaQuery.sizeOf(context).width * 0.1,
                                     decoration: BoxDecoration(
                                      color: bg, 
                                      borderRadius: BorderRadius.circular(14)
                                     ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                           bottomSheet(context,
                                              false,
                                               Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            color: secondaryBg,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                      const SizedBox(height: 5),
                                                                      const Divider(endIndent: 150, indent: 150, thickness: 2),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                                        child: PTPTextWidget(text: 'Update Match Score.', color: Colors.white, fontsize: 26,),
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                                        child: PTPTextWidget(text: "Select and confirm the team's score to update the match results.", 
                                                                        color: Colors.grey, 
                                                                        fontsize: 13,),
                                                                      ),
                                                                                                            
                                                                      Expanded(
                                                                        child: ValueListenableBuilder<int>(
                                                                                                            valueListenable: selectedNumberNotifier,
                                                                                                            builder: (BuildContext context, int selectedNumber, _) {
                                                                                                              return GridView.builder(
                                                                                                                itemCount: 30,
                                                                                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio: 1.3,
                                                            crossAxisCount: 5,
                                                                                                                ),
                                                                                                                itemBuilder: (_, index) {
                                                            int number = index + 1;
                                                            return Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: GestureDetector(
                                                                      onTap: () {
                                                                        selectedNumberNotifier.value = number;
                                                                        context.read<PlayOffState>().addScore1(number);
                                                                      },
                                                                      child: Container(
                                                                        height: 50,
                                                                        width: 65,
                                                                        decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(13),
                                                                                                boxShadow: const [
                                                                                                  BoxShadow(
                                                                                                    color: Color(0xff242223), 
                                                                                                    blurRadius: 13
                                                                                                  )
                                                                                                ],
                                                                                                 color: selectedNumber == number ? primaryColor : const Color(0xff242223),
                                                                        ),
                                                                        child: Center(child: PTPTextWidget(text: "$number" , color: Colors.white,)),
                                                                      ),
                                                              ),
                                                            );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                        },
                                        child: PTPTextWidget(text: '$score1', fontsize: 30, color: primaryColor,)),
                                    ),
                                    ), 
                                     const SizedBox(
                                      width: 10,
                                    ),
                                    const PTPTextWidget(text: ':', fontsize: 40, fontWeight: FontWeight.bold, color: primaryColor,), 
                                     const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                       height: MediaQuery.sizeOf(context).height * 0.1 - 20,
                                      width: MediaQuery.sizeOf(context).width * 0.1,
                                     decoration: BoxDecoration(
                                      color: bg, 
                                      borderRadius: BorderRadius.circular(14)
                                     ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){ 
                                           bottomSheet(context,
                                              false,
                                               Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            color: secondaryBg,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                      const SizedBox(height: 5),
                                                                      const Divider(endIndent: 150, indent: 150, thickness: 2),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                                        child: PTPTextWidget(text: 'Update Match Score.', color: Colors.white, fontsize: 26,),
                                                                      ),
                                                                      const Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                                        child: PTPTextWidget(text: "Select and confirm the team's score to update the match results.", 
                                                                        color: Colors.grey, 
                                                                        fontsize: 13,),
                                                                      ),
                                                                                                            
                                                                      Expanded(
                                                                        child: ValueListenableBuilder<int>(
                                                                                                            valueListenable: selectedNumberNotifier2,
                                                                                                            builder: (BuildContext context, int selectedNumber, _) {
                                                                                                              return GridView.builder(
                                                                                                                itemCount: 30,
                                                                                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio: 1.3,
                                                            crossAxisCount: 5,
                                                                                                                ),
                                                                                                                itemBuilder: (_, index) {
                                                            int number = index + 1;
                                                            return Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: GestureDetector(
                                                                      onTap: () {
                                                                        selectedNumberNotifier2.value = number;
                                                                        context.read<PlayOffState>().addScore2(number);
                                                                      },
                                                                      child: Container(
                                                                        height: 50,
                                                                        width: 65,
                                                                        decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(13),
                                                                                                boxShadow: const [
                                                                                                  BoxShadow(
                                                                                                    color: Color(0xff242223), 
                                                                                                    blurRadius: 13
                                                                                                  )
                                                                                                ],
                                                                                                 color: selectedNumber == number ? primaryColor : const Color(0xff242223),
                                                                        ),
                                                                        child: Center(child: PTPTextWidget(text: "$number" , color: Colors.white,)),
                                                                      ),
                                                              ),
                                                            );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                        },
                                        child: PTPTextWidget(text: '$score2', fontsize: 30, color: primaryColor,)),
                                    ),
                                    ), 
                                     const SizedBox(
                                      width: 10,
                                    ),


                                    //team 2 players
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        1, 
                                      (index) {
                                        // var d = widget.e.first.listOfPlayer[index];
                                    if (widget.e.first.listOfPlayer.isNotEmpty ) {
        return ClipRRect(

          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10, 
              sigmaY: 8
            ),
            child: Container(
              // width: MediaQuery.sizeOf(context).width * 0.3,
               padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
              decoration: BoxDecoration(
                color: bg , 
                borderRadius: BorderRadius.circular(13)
              ),
              child: Center(
                child: PTPTextWidget(
                  fontsize: 13,
                  text: '${widget.e.first.listOfPlayer[2].name} & ${widget.e.first.listOfPlayer[3].name}',
                ),
              ),
            ),
          ),
        );
      } else {
        return const AbsorbPointer();
      }
                                      }), 
                                    
                                    ),
                                  ],
                                ),
                              ), 
                             
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ), 
           
          ],
        ), 
        
        );
  }
}




/*

  selectedNumberNotifier.value = number;
                                context.read<PlayOffState>().addScore1(number);

  


 */