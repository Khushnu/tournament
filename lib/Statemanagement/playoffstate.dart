import 'package:flutter/material.dart';

class PlayOffState extends ChangeNotifier{
  int score1 =0;
  int score2 =0;

int get _score1 => score1;
int get _score2 => score2;


addScore1(int c){ 
  score1 =c;
notifyListeners();
}

addScore2(int c){ 
  score2 =c;
notifyListeners();
}
}