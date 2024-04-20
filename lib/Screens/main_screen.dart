// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:newproject/Screens/Home.dart';

import '../Widgets/favbutn.dart';
import '../components/bottom_animation_icons.dart';
import '../models/bottom_navigation_model.dart';
import '../util/const_utils.dart';
import '../util/rive_utils.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RiveAssets selectbutton = bottomNavs.first;
  List screenBottomPages = [];

  late SMIBool hometrigger;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      selectbutton = bottomNavs[index];
    });
  }

  void navigationTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: [
                const Home(),
                const SearchPlaces(),
                Container(color: Colors.green),
                const Profile(),
              ]),

          //    Positioned(
          //     bottom: 10,
          //     left: 15,
          //     right: 15,
          //      child: SafeArea(
          //           child:Container(
          //           padding: const EdgeInsets.all(12),
          //           margin: const EdgeInsets.symmetric(horizontal: 24),
          //           decoration: BoxDecoration(
          //           color: Constants.darkBG.withOpacity(0.8),
          //           borderRadius: const BorderRadius.all(Radius.circular(24)),
          //            ),
          //                child:Row(
          //                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                  children: [
          //                      ...List.generate(bottomNavs.length, (index) =>
          //                 GestureDetector(
          //                   onTap: (){
          //                      _pageController.jumpToPage(index);
          //                      bottomNavs[index].input!.change(true);
          //                      if(bottomNavs[index].input!=selectbutton){
          //                       setState(() {
          //                        selectbutton=bottomNavs[index];
          //                       });
          //                      }
          //                      Future.delayed(const Duration(seconds: 1),(){
          //                      bottomNavs[index].input!.change(false);
          //                      });
          //                    },
          //                     child: Column(
          //                      mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                        AnimatedBar(isActive: bottomNavs[index]==selectbutton,),
          //                         SizedBox(
          //                          height:36,
          //                          width:36,
          //                          child:Opacity(
          //         opacity: bottomNavs[index]==selectbutton?1:0.5,
          //         child: RiveAnimation.asset(
          //           bottomNavs.first.src,
          //         artboard:bottomNavs[index].artboard,
          //         onInit: (artboard){
          //          StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName: bottomNavs[index].stateMachineName);
          //          bottomNavs[index].input=controller.findSMI('active')as SMIBool;
          //         },
          //         ),
          //                          ),

          //                         ),
          //                       ],
          //                     ),
          //                   ),),
          //                  ],
          //                )
          //              ),
          //            ),
          //    ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Constants.darkBG.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(index);
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index].input != selectbutton) {
                        setState(() {
                          selectbutton = bottomNavs[index];
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                          isActive: bottomNavs[index] == selectbutton,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity:
                                bottomNavs[index] == selectbutton ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI('active') as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

