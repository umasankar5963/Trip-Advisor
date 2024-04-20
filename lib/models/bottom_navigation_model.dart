import 'package:rive/rive.dart';

class RiveAssets {
  final String artboard;
  final String stateMachineName;
  final String title; 
   final String src;
   late SMIBool? input;
   int page=0;
  RiveAssets(this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });
  set setInput(SMIBool status){
    input=status;
  }
}
  
List< RiveAssets>bottomNavs=[
RiveAssets('assets/rivassets/icons.riv', artboard: 'HOME', stateMachineName: "HOME_interactivity", title:'Home',),
RiveAssets('assets/rivassets/icons.riv', artboard: 'SEARCH', stateMachineName: 'SEARCH_Interactivity', title:'Search',),
RiveAssets('assets/rivassets/icons.riv', artboard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title:'Chat'),
RiveAssets('assets/rivassets/icons.riv', artboard: 'USER', stateMachineName: 'USER_Interactivity', title:'Profile'),

];
List<RiveAssets>sideMenus=[
RiveAssets('assets/rivassets/icons.riv', artboard: 'HOME', stateMachineName: "HOME_interactivity", title:'Home', ),
RiveAssets('assets/rivassets/icons.riv', artboard: 'SEARCH', stateMachineName: 'SEARCH_Interactivity', title:'Search',),
RiveAssets('assets/rivassets/icons.riv', artboard: 'LIKE/STAR', stateMachineName: 'STAR_Interactivity', title:'Favorites',),
RiveAssets('assets/rivassets/icons.riv', artboard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title:'Help'),
];

List<RiveAssets>sideMenu2=[
RiveAssets('assets/rivassets/icons.riv', artboard: 'TIMER', stateMachineName: 'TIMER_Interactivity', title:'History'),
RiveAssets('assets/rivassets/icons.riv', artboard: 'BELL', stateMachineName: 'BELL_Interactivity', title:'Requests',),
];

List<RiveAssets>sideMenu3=[
//RiveAssets('assets/rivassets/switch .riv', artboard: 'Switch', stateMachineName: 'Switch', title:'Theme'),
RiveAssets('assets/rivassets/icons.riv', artboard: 'SETTINGS', stateMachineName: 'SETTINGS_Interactivity', title:'Settings',),
];