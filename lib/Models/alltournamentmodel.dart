class AllTournamentModel{
   final String tournamentName;
  final String typeOfTourNament;
  final String tourFOrmat; 
  final String noOfPoints; 
  final List<NoOfPlayers> listOfPlayer;
  final List<ListOfCourt> listOfCourt;
  final List<ListOfTeams> listofTeam;



AllTournamentModel({required this.tournamentName, 
required this.typeOfTourNament, required this.tourFOrmat, 
required this.noOfPoints, required this.listOfPlayer, 
required this.listofTeam, required this.listOfCourt});

}





class NoOfPlayers{
  final String name; 

  NoOfPlayers({required this.name});
}

class ListOfCourt{
  final String courtName;

  ListOfCourt({required this.courtName});
}
class ListOfTeams{
  final String teamName;

  ListOfTeams({required this.teamName});
}