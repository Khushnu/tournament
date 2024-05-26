import 'package:flutter/material.dart';
import 'package:paddle_tournment_pro/Screens/create_tournament_screen.dart';
import 'package:paddle_tournment_pro/Screens/tournament_details_screen.dart';
import 'package:paddle_tournment_pro/Statemanagement/tournamentstate.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_bottomsheet_widget.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_button_widget.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_secondary_button.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_textinput_widget.dart';
import 'package:paddle_tournment_pro/Widgets/text_widget.dart';
import 'package:paddle_tournment_pro/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final editTournamentName = TextEditingController();
  @override
  Widget build(BuildContext context) {
     var listoftournament = context.watch<TournamentState>().allTOurnamentList;
    return  Scaffold(
      backgroundColor: bg,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, MediaQuery.sizeOf(context).height * 0.2 + 25 ), 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1 - 25,
            ),
            const PTPTextWidget(text: 'Padel Tournament Pro', family: 'gilly',  fontsize: 16, fontWeight: FontWeight.w400, color: Colors.grey,),
            RichText(text: const TextSpan(
              text: "Streamlined Tournment ",
              style: TextStyle(color: Colors.black, fontFamily: 'gil', fontSize: 25, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
              text: "Management at ",
              style: TextStyle(color: Colors.black,
               fontFamily: 'gil', fontSize: 24, fontWeight: FontWeight.bold),),
                TextSpan(
              text: "Your Fingertips ",
              style: TextStyle(color: Color(0xff036A41), fontFamily: 'gil', fontSize: 24, fontWeight: FontWeight.bold),)
              ]
            )), 
            const SizedBox(
              height: 13,
            ),
            const SizedBox(
            height: 60, 
            width: double.infinity,
            child: PTPTextInputWidget(hintText: "I'am looking for..",  hintCOlor:  Color(0xff171415), icon: Icon(Icons.search, color: Colors.black,), fontSize: 14, fontWeight: FontWeight.w400,))
          ],
        ),
      )),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                children: [
                  PTPTextWidget(text: 'Your Tournaments', fontsize: 16,), 
                  Spacer(),
                 PTPTextWidget(text: 'Sort By Recent', fontsize: 16, color: primaryColor,),
                  Icon(Icons.arrow_upward_outlined, color: primaryColor, size: 19, ) 
                ],
              ), 
              listoftournament.isEmpty ?  
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height * 0.2),
                      child: const PTPTextWidget(text: 'Click + to create your tournament'),
                    )
                 : 
              Expanded(
                child: ListView.builder(
                  itemCount: listoftournament.length,
                  itemBuilder: (_,index){
                    var e = listoftournament[index];
                     return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> TournamentDetailsScreen(e: [e],)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          //height: MediaQuery.sizeOf(context).height * 0.2 - 18,
                          width: MediaQuery.sizeOf(context).width,
                         padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: generateRandomColor1(),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/bg.png'))
                          ),
                          child: Column( 
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     PTPTextWidget(text: e.tournamentName, fontsize: 22, fontWeight: FontWeight.bold,),
                                     PTPTextWidget(text: e.tourFOrmat, fontsize: 14, color: Colors.grey,)
                                      
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                          //             setState(() {
                          //                 editTournamentName.text = e.tournamentName;
                          //             });
                                     
                          //              bottomSheet(context, 
                          //              false,
                          //    Container(
                          //     decoration: const BoxDecoration(
                          //       color: secondaryBg, 
                          //       borderRadius: BorderRadius.only(topLeft: Radius.circular(23), 
                          //       topRight: Radius.circular(23))
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [ 
                          //           Divider(
                          //             color: Colors.grey.withOpacity(0.8),
                          //             endIndent: 160, 
                          //             indent: 160,
                          //           ),  const SizedBox(
                          //             height: 10, 
                          //           ), 
                          //           const PTPTextWidget(text: 'Edit Tournament', 
                          //           color: Colors.white, fontsize: 30,), 
                          //           PTPTextInputWidget(
                          //             textCOlor: Colors.white,
                          //             hintCOlor: Colors.white,
                          //             hintText: 'Tournament', textEditingController: editTournamentName,
                          //           fillCOlor:const Color(0xff242223),), 
                          //           const SizedBox(
                          //             height: 10,
                          //           ),
                          //           // PTPTextWidget(text: 'text', color: Colors.white,)
                          //           Row(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             children: [
                          //               Image.asset('assets/pers.png', height: 30, width: 20,), 
                          //               const SizedBox(
                          //                 width: 10,
                          //               ),
                          //              PTPTextWidget(text:'${e.listOfPlayer.length} Players', 
                          //               fontsize: 20, 
                          //               color: primaryColor,
                          //               ), 
                          //             ],
                          //           ),
                          //           Column(
                          //             children: e.listOfPlayer.map((e) {
                          //               return Padding(
                          //                 padding: const EdgeInsets.all(8.0).copyWith(left: 0, right: 0),
                          //                 child: Container(
                          //                   height: MediaQuery.sizeOf(context).height * 0.1 - 40, 
                          //                   width: double.infinity,
                          //                  decoration: BoxDecoration(
                          //                   color: const Color(0xff242223), 
                          //                   borderRadius: BorderRadius.circular(10)
                          //                  ),
                          //                  child: Padding(
                          //                    padding: const EdgeInsets.symmetric(horizontal: 10),
                          //                    child: Row(
                          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                     children: [
                          //                       PTPTextWidget(text: e.name, color: Colors.white,), 
                          //                       const Icon(Icons.close, color: primaryColor,)
                          //                     ],
                          //                    ),
                          //                  ),
                          //                 ),
                          //               );
                          //             }).toList(),
                          //           ), 
                          //           const SizedBox(
                          //             height: 10,
                          //           ),
                          //           Container(
                          //                   height: MediaQuery.sizeOf(context).height * 0.1 - 40, 
                          //                   width: double.infinity,
                          //                  decoration: BoxDecoration(
                          //                   color: const Color(0xff242223), 
                          //                   borderRadius: BorderRadius.circular(10)
                          //                  ),
                          //                  child: Padding(
                          //                    padding: const EdgeInsets.symmetric(horizontal: 10),
                          //                    child: Row(
                          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                     children: [
                          //                        PTPTextWidget(text: 'Add player', color: Colors.white.withOpacity(0.5),), 
                          //                       Container(
                          //                         height: 40, 
                          //                         width: 40, 
                          //                         decoration: BoxDecoration(
                          //                           color: primaryColor,
                          //                           borderRadius: BorderRadius.circular(7)
                          //                         ),
                          //                         child: Center(
                          //                           child: Icon(Icons.arrow_drop_up),
                          //                         ),
                          //                       )
                          //                     ],
                          //                    ),
                          //                  ),
                          //                 ),
                          //         ],
                          //       ),
                          //     ),
                          //   )
                          // );
                                    },
                                    child: Image.asset('assets/edit.png'))
                                ],
                              ), 
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1 - 50,
                        ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                    SizedBox(
                                    width: MediaQuery.sizeOf(context).width * 0.2 + 10 ,
                                  ),
                                 PTPSecondaryButtonWIdget(
                                  height: 35,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/pers.png', scale: 1.3,), 
                                        const SizedBox(
                                          width: 7,
                                        ),
                                       PTPTextWidget(text:'${e.listOfPlayer.length} Players', 
                                        fontsize: 14, 
                                        color: primaryColor,
                                        ), 
                                      ],
                                    ),),
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  PTPSecondaryButtonWIdget(
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/rounds.png'), 
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const PTPTextWidget(text:'4 Rounds', 
                                        fontsize: 15, 
                                        color: primaryColor,
                                        ), 
                                      ],
                                    ),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120, 
        width: double.infinity,
        padding: const EdgeInsets.all(30).copyWith(bottom: 33, top: 25),
        color: const Color(0xffF3EFEC),
        child: 
           PTPButtonWidget(
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const CreateTournamentScreen()));
            },
            child:  const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white,), 
              SizedBox(
                width: 10,
              ),
             PTPTextWidget(text: 'Create Tournament', color: Colors.white, fontsize: 16,)
            ] 
          ) 
            ))
          ),
        );
  }
}