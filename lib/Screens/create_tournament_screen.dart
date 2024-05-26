import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paddle_tournment_pro/Models/alltournamentmodel.dart';
import 'package:paddle_tournment_pro/Models/homemodel.dart';
import 'package:paddle_tournment_pro/Models/tournamentmodel.dart';
import 'package:paddle_tournment_pro/Statemanagement/tournamentstate.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_button_widget.dart';
import 'package:paddle_tournment_pro/Widgets/ptp_textinput_widget.dart';
import 'package:paddle_tournment_pro/Widgets/text_widget.dart';
import 'package:paddle_tournment_pro/theme.dart';
import 'package:provider/provider.dart';

class CreateTournamentScreen extends StatefulWidget {
  const CreateTournamentScreen({super.key});

  @override
  State<CreateTournamentScreen> createState() => _CreateTournamentScreenState();
}

class _CreateTournamentScreenState extends State<CreateTournamentScreen> {
  final tournamtname = TextEditingController();
  final playerText = TextEditingController();
  final player2Text = TextEditingController();
  final courtText = TextEditingController();
  final teamText = TextEditingController();

  bool isPlayer = false;
  var currentTourTypeSelect;
  var currentTourFormatSelect;
  var currentNoOfPointsSelect;
  var currentGender;
  @override
  Widget build(BuildContext context) {
   
    var listofPlayers = context.watch<TournamentState>().listofPlayers;
    var listofcourt = context.watch<TournamentState>().listofCourt;
    var listofteam = context.watch<TournamentState>().lsitofTeams;
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Image.asset(
                      'assets/bgeclip.png',
                      fit: BoxFit.fill,
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1 - 30,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: primaryColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: RichText(
                        text: const TextSpan(
                            text: "Create Your New  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'gil',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: "Tournament. ",
                            style: TextStyle(
                                color: Color(0xff036A41),
                                fontFamily: 'gil',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                    child: PTPTextWidget(text: 'Tournament Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                        height: 60,
                        child: PTPTextInputWidget(


                            textEditingController: tournamtname,
                            hintText: 'Padle World Cup', hintCOlor: Color(0xff000000), fontWeight: FontWeight.w400, fontSize: 16,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      // height: MediaQuery.sizeOf(context).height,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: SingleChildScrollView(
                          // physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            // mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const PTPTextWidget(text: 'Type of Tournament'),
                              SizedBox(
                                // height:
                                //     MediaQuery.sizeOf(context).height * 0.1 -
                                //         10,
                                width: double.infinity,
                                // color: Colors.amber,
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: typeTourList.map((e) {
                                      bool isSelected =
                                          currentTourTypeSelect == e;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentTourTypeSelect = e;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(
                                            left: 0,
                                          ),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.1 -
                                                29,
                                            width: MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.3 -
                                                2,
                                            decoration: BoxDecoration(
                                                color: isSelected
                                                    ? primaryColor
                                                    : bg,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: PTPTextWidget(
                                                  fontsize: 13,
                                              fontWeight: FontWeight.w400,
                                              text: e.name,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const PTPTextWidget(
                                text:
                                    'An Americano tournament in padel is a format where each player competes in several short matches, partnering with and against different opponents in each round.',
                                color: Color(0xff000000),
                                fontsize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PTPTextWidget(text: 'Select Format'),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                // height:
                                //     MediaQuery.sizeOf(context).height * 0.5  ,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: bg,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: listTournamementModel.map((e) {
                                    bool isSelected =
                                        currentTourFormatSelect == e.tournamentname;
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentTourFormatSelect = e.tournamentname;
                                          });
                                        },
                                        child: Container(
                                          // height: MediaQuery.sizeOf(context)
                                          //             .height *
                                          //        0.1 +
                                          //     34,
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: isSelected
                                                  ? primaryColor
                                                  : secondaryUI,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              PTPTextWidget(
                                                text: e.tournamentname,
                                                fontsize: 19,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              const SizedBox(
                                                height: 0,
                                              ),
                                              PTPTextWidget(
                                                text: e.tournamentType,
                                                fontsize: 13,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black
                                                        .withOpacity(0.6),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PTPTextWidget(text: 'Number of Points'),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.1 +
                                        45,
                                child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: noPointsList.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 0,
                                            childAspectRatio: 2),
                                    itemBuilder: (_, index) {
                                      bool isSelected =
                                          currentNoOfPointsSelect ==
                                              noPointsList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentNoOfPointsSelect =
                                                noPointsList[index];
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 25,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: isSelected
                                                    ? primaryColor
                                                    : secondaryUI),
                                            child: index == 5
                                                ? Image.asset(
                                                    noPointsList.last.no,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  )
                                                : Center(
                                                    child: PTPTextWidget(
                                                        text:
                                                            noPointsList[index]
                                                                .no,
                                                        color: isSelected
                                                            ? Colors.white
                                                            : Colors.black)),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PTPTextWidget(text: 'Add Players'),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.2 + 14,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: secondaryUI,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                const SizedBox(
                                          height: 8,
                                        ),

                                    PTPTextInputWidget(
                                        textEditingController:
                                            playerText,
                                        onchage: (v) {
                                          setState(() {
                                            isPlayer = v.isNotEmpty;
                                          });
                                        },
                                      
                                        hintText: 'Player 1'),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                            PTPTextInputWidget(
                                                textEditingController:
                                                    player2Text,
                                                onchage: (v) {
                                                  setState(() {
                                                    isPlayer = v.isNotEmpty;
                                                  });
                                                },
                                                hintText: 'Player 2'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PTPButtonWidget(
                                  bgCOlor: Colors.black,
                                  size: const Size(double.infinity, 50),
                                  ontap: () {
                                    context.read<TournamentState>().addPlayer(NoOfPlayers(name: playerText.text));
                                    context.read<TournamentState>().addPlayer(NoOfPlayers(name: player2Text.text));
                                    playerText.clear();
                                    player2Text.clear();
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      PTPTextWidget(
                                        text: 'Add Player',
                                        color: Colors.white,
                                        fontsize: 15,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const PTPTextWidget(text: 'Add Court'),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.1 +
                                        60,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: secondaryUI,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PTPTextWidget(
                                      text: 'Court 1',
                                      fontsize: 14,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                        child: PTPTextInputWidget(
                                            textEditingController: courtText,
                                            
                                            hintText: 'Court name')),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PTPButtonWidget(
                                  bgCOlor: Colors.black,
                                  size: const Size(double.infinity, 50),
                                  ontap: () {
                                    context.read<TournamentState>().addCourt(ListOfCourt(courtName: courtText.text));
                                    courtText.clear(); 
                                                                     },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      PTPTextWidget(
                                        text: 'Add Court',
                                        color: Colors.white,
                                        fontsize: 15,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const PTPTextWidget(text: 'Add Team'),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.1 +
                                        50,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: secondaryUI,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PTPTextWidget(
                                      text: 'Team 1',
                                      fontsize: 14,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                        child: PTPTextInputWidget(
                                            textEditingController: teamText,
                                            onchage: (v) {
                                              setState(() {
                                                isPlayer = v.isNotEmpty;
                                              });
                                            },
                                            hintText: 'Team name')),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PTPButtonWidget(
                                  bgCOlor: Colors.black,
                                  size: const Size(double.infinity, 50),
                                  ontap: () {},
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      PTPTextWidget(
                                        text: 'Add Team',
                                        color: Colors.white,
                                        fontsize: 15,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              PTPButtonWidget(
                                  bgCOlor: primaryColor,
                                  size: const Size(double.infinity, 60),
                                  ontap: () {
                                    context
                                        .read<TournamentState>()
                                        .addTournament(AllTournamentModel(
                                            tournamentName: tournamtname.text,
                                            typeOfTourNament:
                                                currentTourTypeSelect.toString(),
                                            tourFOrmat: currentTourFormatSelect.toString(),
                                            noOfPoints: currentNoOfPointsSelect.toString(),
                                            listOfPlayer: listofPlayers,
                                            listofTeam: listofteam,
                                            listOfCourt: listofcourt));

                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      PTPTextWidget(
                                        text: 'Creat Tournament',
                                        color: Colors.white,
                                        fontsize: 15,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
