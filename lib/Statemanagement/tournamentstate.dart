import 'package:flutter/cupertino.dart';
import 'package:paddle_tournment_pro/Models/alltournamentmodel.dart';

class TournamentState extends ChangeNotifier{

List<AllTournamentModel> allTOurnamentList = [];
List<NoOfPlayers> listofPlayers = [];
List<ListOfCourt> listofCourt = [];
List<ListOfTeams> lsitofTeams = [];

List<AllTournamentModel> get _listOFAll => allTOurnamentList;
List<NoOfPlayers> get _listOfPlayer => listofPlayers;
List<ListOfCourt> get _listOfCourt => listofCourt;
List<ListOfTeams> get _listOfTeans => lsitofTeams;


addTournament(AllTournamentModel m){
  allTOurnamentList.add(m);
  notifyListeners();
}

addPlayer(NoOfPlayers m){
  listofPlayers.add(m);
  notifyListeners();
}

addTeam(ListOfTeams m){
  lsitofTeams.add(m);
  notifyListeners();
}
addCourt(ListOfCourt m){
  listofCourt.add(m);
  notifyListeners();
}

}