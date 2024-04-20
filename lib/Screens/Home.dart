
import 'package:flutter/material.dart';
import 'package:newproject/Screens/sidemenu.dart';
import 'package:newproject/models/menubutn.dart';
import 'package:newproject/util/rive_utils.dart';
import 'package:rive/rive.dart';
import '../Widgets/ vertical_india_Places.dart';
import '../Widgets/horizontal_india_places.dart';
import '../util/const_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  bool isSideMenuClosed=true;
  late AnimationController _animationController;
  late Animation animation;
 
  late SMIBool isSideBarClosed;
  @override
  void initState() {
   _animationController=AnimationController(vsync: this,duration:const Duration(microseconds:200 ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor:isSideMenuClosed?Constants.lightPrimary:Constants.sideMenu,
      // appBar: AppBar(
      //  backgroundColor: Constants.lightPrimary,
      //  ),
      //  drawer: Drawer(
      //   child: SideMenu(),
      //  ),
     body: Stack(
      children: [
        //HomeBody (),
      AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        left: isSideMenuClosed?-288:0,
        width: 288,
        height: MediaQuery.of(context).size.height,
        child: SideMenu()),
        Transform.translate(
          offset: Offset(isSideMenuClosed?0:288, 0.0),
          child: Transform.scale(
            scale: isSideMenuClosed?1:0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isSideMenuClosed?0:24),
              child: HomeBody()),
          ),
          ),



         MenuButn(
          press: (){
            isSideBarClosed.value=!isSideBarClosed.value;
            setState(() {
             isSideMenuClosed=isSideBarClosed.value;
            });
         }, riveOnInit: (artboard) {  
            StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName: "State Machine");
                       isSideBarClosed=controller.findSMI('isOpen')as SMIBool;
                       isSideBarClosed.value=true;
         }, 
       ),

       
       
      ],
     )
               );
  }
}


class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
 
    
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.lightPrimary,
        body: ListView(  
          //physics: const NeverScrollableScrollPhysics(),
           children: [
          //  Container(
          //     padding: const EdgeInsets.only(top:20,bottom: 30),
          //    child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //        IconButton(onPressed: (){
          //         SideMenu();
          //         }, icon:const Icon(Icons.sort,size: 40,)),
          //     Material(
          //       shape: const CircleBorder(side: BorderSide.none),
          //       elevation: 15,
          //      child: CircleAvatar(
          //        radius:20,
          //       child: ClipOval(
          //        child: Image.network(
          //         'https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg?auto=compress&cs=tinysrgb&w=1600',
          //         fit: BoxFit.fill,
          //          height: 100,
          //       ) ,
          //    ),
          //      ),
          //     ),
          //       ],
          //     ),
          //   ),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:12,right: 15),
                child: GestureDetector(
                 onTap: (){},
                 child: Container(
                      height:40,width:40,
                      decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),
                 color: Colors.transparent,
                      ),
                 child:const RiveAnimation.asset('assets/rivassets/notification.riv',
                  artboard:'New Artboard',
                 // onInit: (artboard){
                 //              StateMachineController controller=RiveUtils.getRiveController(artboard,stateMachineName: );
                 //              bottomNavs[index].input=controller.findSMI('active')as SMIBool;
                 //             },
                 ),
                      ),
                       ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
            Padding(
            padding: const EdgeInsets.only(left:30.0,bottom: 10),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Constants.darkPrimary
              ),
            ),),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,),
            child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),elevation: 9,
                 child:TextField(
                  cursorColor: Constants.buttonscolor,
                           //autofocus: true,
                           decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                            ),
                            hintText: 'Discover a city',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 18
                            ),
                    prefixIcon:  Icon(Icons.search, color: Constants.darkPrimary),
                    suffixIcon: IconButton(onPressed: (){
                          }, icon:  Icon(Icons.filter_list ,color: Constants.darkPrimary))
                        ),
                       ),
                       ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,top: 10),
             child: Text('Explore',style: Constants.categoeryheader,),
          ),
                  // const Padding(padding: EdgeInsets.all(10)),
                 HorizontalPlaces(),
                 VeticalPlaces(),
                 //const SizedBox(height: 80,),
                   ],
                 ),
      ),
    );
  }
  
  
  }




