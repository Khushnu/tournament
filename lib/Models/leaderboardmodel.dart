class LeaderBoardModel{
  final String serno;
  final String name; 
  final String points;

  LeaderBoardModel(this.serno, {required this.name, required this.points});
}

List<LeaderBoardModel> listPoints = [
  LeaderBoardModel('01.', name: 'Ahmed Mohamed', points: '250 Points'),
  LeaderBoardModel('02.', name: 'Ilham Dakir', points: '250 Points'),
  LeaderBoardModel('03.', name: 'Salima Ahmed', points: '250 Points'),
  LeaderBoardModel('04.', name: 'Mohammed Alawi', points: '250 Points'),
  LeaderBoardModel('05.', name: 'Salman Ali', points: '250 Points'),
  LeaderBoardModel('06.', name: 'Nuruzzaman Sadik', points: '250 Points'),
];
