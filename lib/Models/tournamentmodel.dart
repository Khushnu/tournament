
class TypeOfTournament{
  final String name; 

  TypeOfTournament({required this.name});
}

List<TypeOfTournament> typeTourList = [
  TypeOfTournament(name: 'Americano'),
  TypeOfTournament(name: 'Mexicano'),
  TypeOfTournament(name: 'Mixicano'),
];


class TournamentFormatModel{
  final String tournamentname;
  final String tournamentType; 
  
  
  TournamentFormatModel({required this.tournamentname, required this.tournamentType, });
}

List<TournamentFormatModel> listTournamementModel =[
TournamentFormatModel(tournamentname: 'Classic Americano', 
tournamentType: 'Classic americano where all players will play together once.',),
TournamentFormatModel(tournamentname: 'Mixed Americano', 
tournamentType: 'All players will team up with a player of the opposite sex once. This type requires a balanced number of males and females.',),
TournamentFormatModel(tournamentname: 'Team Americano', 
tournamentType: 'Each team will play the opposite team once. Perfect if you have already assigned the teams.',),

];




class NoOfPoints{
  final String no;


  NoOfPoints({required this.no, });
}

List<NoOfPoints> noPointsList = [
 NoOfPoints(no: '6'),
 NoOfPoints(no: '12'),
 NoOfPoints(no: '18'),
 NoOfPoints(no: '24'),
 NoOfPoints(no: '30'),
 NoOfPoints(no: 'assets/infinity.png'),
];