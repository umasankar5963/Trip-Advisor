// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newproject/Screens/Home.dart';
import 'package:newproject/Screens/profile_screen.dart';
import 'package:newproject/models/bottom_navigation_model.dart';
import 'package:newproject/models/info_card.dart';
import 'package:rive/rive.dart';
import '../components/side_menu_tile.dart';
import '../models/profile_features_model.dart';
import '../util/const_utils.dart';
import '../util/rive_utils.dart';
import 'main_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAssets riveAssetMenu = sideMenus.first;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: 288,
          color: Constants.sideMenu,
          child: SafeArea(
              child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const InfoCard(
                name: 'Uma Sankar',
                proffesion: 'Tester',
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16, left: 24),
                  child: Text(
                    'Browser'.toUpperCase(),
                    style: const TextStyle(color: Colors.white70),
                  )),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  isActive: riveAssetMenu == menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    //_navigateToScreen(context);
                    menu.input!.change(true);
                    setState(() {
                      riveAssetMenu = menu;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16, left: 24),
                  child: Text(
                    'History'.toUpperCase(),
                    style: const TextStyle(color: Colors.white70),
                  )),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  isActive: riveAssetMenu == menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    setState(() {
                      riveAssetMenu = menu;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                  },
                ),
              ),

              //  const Expanded(
              //    child: SizedBox(
              //     height: 100,
              //    ),
              //  ),
              Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16, left: 24),
                  child: Text(
                    'Settings'.toUpperCase(),
                    style: const TextStyle(color: Colors.white70),
                  )),
              ...sideMenu3.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  isActive: riveAssetMenu == menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    setState(() {
                      riveAssetMenu = menu;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ))),
    );
  }
  // Future<void> _navigateToScreen(BuildContext context) async {
  //   // Simulating an asynchronous operation
  //   await Future.delayed(const Duration(seconds: 1));
  //   // Navigating to the desired screen after the operation is complete
  //   Widget menuitems=sideMenuItems(index,context);
  // }
}

//  sideMenuItems(int index,context){
//   switch(index){
//     case 0:
//     return NavigationBar(destinations: destinations);
   
//   }
//  }
 