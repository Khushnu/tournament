import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:paddle_tournment_pro/Models/alltournamentmodel.dart';
import 'package:paddle_tournment_pro/Models/benchplayers.dart';
import 'package:paddle_tournment_pro/Models/leaderboardmodel.dart';
import 'package:paddle_tournment_pro/Models/roundsmodel.dart';
import 'package:paddle_tournment_pro/Screens/playoff_screen.dart';
import 'package:paddle_tournment_pro/Statemanagement/scorestate.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_bottomsheet_widget.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_textinput_widget.dart';
import 'package:paddle_tournment_pro/Widgets/text_widget.dart';
import 'package:paddle_tournment_pro/theme.dart';
import 'package:provider/provider.dart';

class TournamentDetailsScreen extends StatefulWidget {
  final List<AllTournamentModel> e;
  const TournamentDetailsScreen({super.key, required this.e});

  @override
  State<TournamentDetailsScreen> createState() =>
      _TournamentDetailsScreenState();
}

class _TournamentDetailsScreenState extends State<TournamentDetailsScreen> {
  // late List<AllTournamentModel> listTournament;
  ScrollController _scrollController = ScrollController();

  ValueNotifier<int> selectedNumberNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> selectedNumberNotifier2 = ValueNotifier<int>(0);
  ValueNotifier<LeaderBoardModel> selectedNumberNotifier4 = ValueNotifier<LeaderBoardModel>(listPoints[0]);

  final editTournamentName = TextEditingController();

  var currentRound = roundList[3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   editTournamentName.text == widget.e.first.tournamentName;
  }

  @override
  Widget build(BuildContext context) {
    var score1 = context.watch<ScoreState>().score1;
    var score2 = context.watch<ScoreState>().score2;

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
                GestureDetector(
                  onTap: (){
                      bottomSheet(context, 
                                     false,
                           Container(
                            decoration: const BoxDecoration(
                              color: secondaryBg, 
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(23), 
                              topRight: Radius.circular(23))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(

                                    color: Colors.grey.withOpacity(0.8),
                                    endIndent: 160,
                                    indent: 160,
                                  ),  const SizedBox(
                                    height: 10,
                                  ),
                                  const PTPTextWidget(text: 'Edit Tournament',
                                  color: Colors.white, fontsize: 30,),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        PTPTextInputWidget(
                                          textCOlor: Colors.white,
                                          hintCOlor: Colors.white,
                                          hintText: 'Tournament',
                                          textEditingController: editTournamentName,
                                        fillCOlor:const Color(0xff242223),),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // PTPTextWidget(text: 'text', color: Colors.white,)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset('assets/pers.png', height: 30, width: 20,),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                           PTPTextWidget(text:'${widget.e.first.listOfPlayer.length} Players',
                                            fontsize: 20,
                                            color: primaryColor,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: widget.e.first.listOfPlayer.map((e) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0).copyWith(left: 0, right: 0),
                                              child: Container(
                                                height: MediaQuery.sizeOf(context).height * 0.1 - 40,
                                                width: double.infinity,
                                               decoration: BoxDecoration(
                                                color: const Color(0xff242223),
                                                borderRadius: BorderRadius.circular(10)
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 10),
                                                 child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    PTPTextWidget(text: e.name, color: Colors.white,),
                                                    const Icon(Icons.close, color: primaryColor,)
                                                  ],
                                                 ),
                                               ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                                height: MediaQuery.sizeOf(context).height * 0.1 - 40,
                                                width: double.infinity,
                                               decoration: BoxDecoration(
                                                color: const Color(0xff242223),
                                                borderRadius: BorderRadius.circular(10)
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 10),
                                                 child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                     PTPTextWidget(text: 'Add player', color: Colors.white.withOpacity(0.5),),
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius: BorderRadius.circular(7)
                                                      ),
                                                      child: const Center(
                                                        child: Icon(Icons.arrow_drop_up),
                                                      ),
                                                    )
                                                  ],
                                                 ),
                                               ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        );
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.1 - 45, 
                    width: MediaQuery.sizeOf(context).width * 0.1 + 12,  
                    decoration: BoxDecoration(
                       color: bgPrimary,
                       borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                )
                ],
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: roundList.map((e) {
                  bool isSelected = currentRound == e;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentRound = e;
            //                double offset = (MediaQuery.of(context).size.width * 0.3 - 20 + 8) * roundList.indexOf(e);
            // _scrollController.animateTo(
            //   offset,
            //   duration: Duration(milliseconds: 200),
            //   curve: Curves.easeInOut,
            // );
                        //  roundList.remove(e);
                        //   roundList.insert(2, currentRound);
                        });
                      },
                      child: Container(
                        height: 50,
                        width: isSelected
                            ? MediaQuery.sizeOf(context).width * 0.3 - 20
                            : MediaQuery.sizeOf(context).width * 0.1 + 17,
                        decoration: BoxDecoration(
                            color: isSelected ? Colors.black : bgPrimary,
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: PTPTextWidget(
                            fontsize: 14,
                            fontWeight: FontWeight.w400,
                            text: isSelected ? "Round ${e.round}" : e.round,
                            color: isSelected ? Colors.white : Colors.black,
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
                        },
                        child: Container(
                         // height: MediaQuery.sizeOf(context).height * 0.2 - 10,
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
                                //height: MediaQuery.sizeOf(context).height * 0.1 - 60,
                              ),
                              Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      }
                                      }), 
                                    
                                    ),
                                    // const SizedBox(
                                    //   width: 10,
                                    // ),
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
                                                                        context.read<ScoreState>().score1Add(number);
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
                                    //
                                    const PTPTextWidget(text: ':', fontsize: 40, fontWeight: FontWeight.bold, color: primaryColor,), 
                                    //  const SizedBox(
                                    //   width: 10,
                                    // ),
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
                                                                        context.read<ScoreState>().score2Add(number);
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
                                    //  const SizedBox(
                                    //   width: 10,
                                    // ),


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
                  fontsize: 15,
                  text: '${widget.e.first.listOfPlayer[2].name} & ${widget.e.first.listOfPlayer[3].name}',
                ),
              ),
            ),
          ),
        );
      } else {
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
                  fontsize: 15,
                  text: '${widget.e.first.listOfPlayer[2].name} & ${widget.e.first.listOfPlayer[3].name}',
                ),
              ),
            ),
          ),
        );
      }
                                      }), 
                                    
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: PTPTextWidget(text: 'Bench Player'),
            ),
            SingleChildScrollView( 
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listBenchPlayers.map((e){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30, 
                      padding: const EdgeInsets.symmetric(horizontal:10, ),
                      decoration: BoxDecoration(
                        color: bgPrimary, 
                        borderRadius: BorderRadius.circular(14)
                    
                      ),
                      child: Center(child: PTPTextWidget(text: e.name, fontsize: 10, fontWeight: FontWeight.w400,)),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ), 
        floatingActionButton: GestureDetector(
          onTap: (){
            bottomSheet(
              context, 
              false,
             BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5, 
                sigmaY: 5
              ),
               child: ValueListenableBuilder(
               valueListenable: selectedNumberNotifier4, 
               builder: (_, i, child){
                return  Container(
                  // height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: secondaryBg, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight: Radius.circular(20))
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [ 
                          const SizedBox(
                            height: 5,
                          ),
                           Divider(
                            endIndent: 160, 
                            indent: 160, 
                            color: Colors.grey.withOpacity(0.4),
                            thickness: 2,
                          ),
                            const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PTPTextWidget(text: 'Leaderboard.', color: Colors.white, 
                                fontsize: 34,), 
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=> PlayOffScreen(e: widget.e,) ));
                                    },
                                    child: Container(
                                      height: 35, 
                                      width: MediaQuery.sizeOf(context).width *0.3, 
                                     decoration: BoxDecoration(
                                       color: Colors.black,
                                       borderRadius: BorderRadius.circular(10),
                                       border: Border.all(color: primaryColor, width: 3) 
                                     ),
                                     child: const Center(child: PTPTextWidget(
                                      text: 'Start Playoffs', 
                                        fontsize: 15,
                                       color: primaryColor,)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ), 
                         Expanded(
                           child: ListView.builder(
                            itemCount: listPoints.length,
                            itemBuilder: (_, index){
                            var e = listPoints[index];
                               bool isSelected = selectedNumberNotifier4.value ==e;
                              return GestureDetector(
                                onTap: (){
                                  //  selectedNumberNotifier4.value == listPoints[0];
                                  // selectedNumberNotifier4.value =e;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height * 0.1 - 30, 
                                    width: double.infinity,
                                   decoration: BoxDecoration(
                                     color: isSelected ? primaryColor : const Color(0xff242223),
                                     borderRadius: BorderRadius.circular(13)
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        PTPTextWidget(text: e.serno , color: Colors.white,), 
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        PTPTextWidget(text: e.name , color: Colors.white,), 
                                        const Spacer(),
                                        PTPTextWidget(text: e.points , 
                                        color: isSelected ? Colors.black : primaryColor,), 
                                     
                                      ],
                                     ),
                                   ),
                                  ),
                                ),
                              );
                           }),
                         )
                        ],
                      ),
                      Align( 
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          child: Container(
                                    height: MediaQuery.sizeOf(context).height *0.1 - 10, 
                                    width: double.infinity,
                                    decoration: BoxDecoration(            
                                      color: Colors.grey,
                                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                            // Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.1),
                            Colors.grey.withOpacity(0.1),
                            Colors.grey.withOpacity(0.2),
                            
                                ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // stops: [0, 0.4,],
                      ),
                            ),
                                  ),
                        ),
                      )
                    ],
                  ),
                );
               }),
             )
            );
          },
          child: Container(
            height: 65, 
            width: 70, 
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle
            ),
            child: Center(child: Image.asset('assets/achiv.png', scale: 1.4,)),
          ),
        ),
        );
  }
}