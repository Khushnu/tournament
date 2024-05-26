import 'package:flutter/material.dart';

class ScoreState extends ChangeNotifier {

int score1 =0;
int score2 =0; 


int get _score1 => score1;
int get _score2 => score2; 


score1Add(int a){
  score1 = a;
  notifyListeners();
}

score2Add(int b){
  score2 = b; 
  notifyListeners();
}


}