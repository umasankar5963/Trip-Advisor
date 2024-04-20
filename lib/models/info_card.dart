import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../util/const_utils.dart';
import '../util/rive_utils.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String proffesion;
  const InfoCard({
    Key? key,
    required this.name,
    required this.proffesion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   late SMIBool userTrigger;
    return  ListTile(
               onTap:(){
                //userTrigger.change(true);
               } ,
                leading:CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 20,
                  //child: Icon(Icons.person,color:Constants.textButncolor),
                  child:RiveAnimation.asset(
                   'assets/rivassets/icons.riv',
                    artboard:'USER',
                      onInit: (artboard){
                       StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName:'USER_Interactivity');
                      userTrigger = controller.findSMI('active')as SMIBool;
                      
                      },
                  )

                   ),
                  title:Text(name,style: TextStyle(color:Constants.whiteColorBg),),
                  subtitle:Text(proffesion,style: TextStyle(color:Constants.whiteColorBg),),
              );
  }
}
