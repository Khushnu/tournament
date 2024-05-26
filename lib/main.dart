import 'package:flutter/material.dart';
import 'package:paddle_tournment_pro/Screens/home_screen.dart';
import 'package:paddle_tournment_pro/Statemanagement/playoffstate.dart';
import 'package:paddle_tournment_pro/Statemanagement/scorestate.dart';
import 'package:paddle_tournment_pro/Statemanagement/tournamentstate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> TournamentState()),
    ChangeNotifierProvider(create: (_)=> ScoreState()),
    ChangeNotifierProvider(create: (_)=> PlayOffState()),
   ], 
   child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}