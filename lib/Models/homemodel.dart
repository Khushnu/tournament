import 'dart:ui';

class HomeModel{
  final String name; 
  final String subtitle; 
  final String noOfplayer;
  final String nuoOfrounds;
  final Color bgColor;

  HomeModel( {required this.name, required this.subtitle, required this.noOfplayer, required this.nuoOfrounds, required this.bgColor,});
}

List<HomeModel> listHome =[
  HomeModel(name: 'Padel World Cup', subtitle: 'Classic Americano', 
  noOfplayer: '4 Players', nuoOfrounds: '10 Rounds', bgColor: Color(0xffF3EFEC)),
  HomeModel(name: 'Padel World Cup', subtitle: 'Classic Americano', 
  noOfplayer: '4 Players', nuoOfrounds: '10 Rounds',bgColor: Color(0xffF1F4ED)),
  HomeModel(name: 'Padel World Cup', subtitle: 'Classic Americano', 
  noOfplayer: '4 Players', nuoOfrounds: '10 Rounds',bgColor: Color(0xffEDEEF4)),
  HomeModel(name: 'Padel World Cup', subtitle: 'Classic Americano', 
  noOfplayer: '4 Players', nuoOfrounds: '10 Rounds',bgColor: Color(0xffF3F2EB)),
];


class GenderClass{
  final String gender; 
  

  GenderClass({required this.gender, });
}

List<GenderClass> listGender = [
  GenderClass(gender: 'Male',),
  GenderClass(gender: 'Female',),
];