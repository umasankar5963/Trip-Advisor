import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newproject/loginui/siginin.dart';
import 'package:newproject/models/onboardpage.dart';
import 'package:newproject/util/const_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TimerImageDisplay extends StatefulWidget {
  const TimerImageDisplay({super.key});
  @override
  _TimerImageDisplayState createState() => _TimerImageDisplayState();
}
class _TimerImageDisplayState extends State<TimerImageDisplay> {
  bool _showImage = true;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        _showImage = !_showImage;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         _showImage
            ? TimerImage ()
            : OnboardingPage(),
          );
  }
}
class TimerImage extends StatefulWidget {
  const TimerImage({super.key});
  @override
  State<TimerImage> createState() => _TimerImageState();
}
class _TimerImageState extends State<TimerImage> {
  double radius=200;
  @override
  Widget build(BuildContext context) {
    return
   Scaffold(
     body: Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height,
            child:Image.network("https://images.pexels.com/photos/2070485/pexels-photo-2070485.jpeg?auto=compress&cs=tinysrgb&w=1600",fit:BoxFit.cover),)
          ],
      ),
   );
  }
}


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
class _OnboardingPageState extends State<OnboardingPage> {
   final PageController _pageController = PageController( initialPage: 0,);
   bool isLastPage=false;
   @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
    _timer.cancel();
  }
  int _currentPage = 0;
  late Timer _timer;
@override
void initState() {
  super.initState();
  _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
timer.cancel();
    }

    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  });
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => isLastPage=index ==2);
          },
          children: [
           buildPage(
           color: Constants.buildpage1, imageurl:"assets/WomenTravel.jpg" , subtitle:"Discover millons of places to stay your route", title: "Travel more your way",
           ),
           buildPage(
           color:Constants.buildpage2, imageurl:"assets/menTravel.jpg" , subtitle:"When are here to help you to discover the world easily", title: "Discover The World",
           ),
           buildPage(
           color:Constants.buildpage3, imageurl:"assets/Traveltime.jpg" , subtitle:"Get Ready Fast for Fall Leaf Viewing Trips", title: "Travel Time ",
           ),
          ],  
         ),
         ),
         bottomSheet:isLastPage?
         GestureDetector(
           onTap: ()async{
           Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>SiginIn()));
           },child:Container(
            decoration: BoxDecoration(
              color:Constants.buttonscolor,
              borderRadius:const BorderRadius.all(Radius.circular(5))),
             width: MediaQuery.of(context).size.width,
             height: 60, 
             child: const Center(child: Text("Get Started",style:TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),))),
      ):
      Card(
        color: Constants.lightPrimary,
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
           TextButton(onPressed: ()=>_pageController.jumpToPage(2), child: const Text("SKIP")),
           Center(child:SmoothPageIndicator(controller: _pageController, count: 3,effect: WormEffect(dotColor: Colors.black26,spacing: 16,activeDotColor:Constants.activedot),
            onDotClicked: (index) => _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
            ),
            ),
           TextButton(onPressed: ()=>_pageController.nextPage(duration: const Duration(milliseconds: 500), curve:Curves.easeInOut ),child: const Text("NEXT")),
             ],
             ),
        ),
      )
    );
  }
}
 