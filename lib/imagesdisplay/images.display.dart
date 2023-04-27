
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newproject/siginin.dart';
import 'package:newproject/models/onboardpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageDisplayTimer extends StatefulWidget {
  const ImageDisplayTimer({super.key});

  @override
  _ImageDisplayTimerState createState() => _ImageDisplayTimerState();
}

class _ImageDisplayTimerState extends State<ImageDisplayTimer> {
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
    // return Image.asset("assets/ImageTimer.jpg",fit: BoxFit.cover,height: MediaQuery.of(context).size.height,
    return
     
   Scaffold(
     body: Stack(
          children: [
            
            //  Container(
            //   // margin:EdgeInsets.only(top: 340),
              
            //   //  padding: EdgeInsets.only(top: 100),
            //   alignment:Alignment.bottomCenter,
            //   child: Image.network("https://i.pinimg.com/564x/3f/3d/33/3f3d33411c678b9c7604ae3ae1a49e87.jpg",fit: BoxFit.cover,width:MediaQuery.of(context).size.width, )),
            // Container(
            //   alignment: Alignment.topCenter,
           
              
            //   height: 500,
            //   decoration: BoxDecoration(
               
            //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius),bottomRight:Radius.circular(radius) ),
            //   image: const DecorationImage(image:NetworkImage("https://i.pinimg.com/564x/89/fe/61/89fe61ccf47d8c6ed3c60d6176ad25fd.jpg",) ,fit: BoxFit.cover),
              
              
              
            //   ),
              
             
                 
            // ),
            Container(height: MediaQuery.of(context).size.height,child:Image.network("https://images.pexels.com/photos/2070485/pexels-photo-2070485.jpeg?auto=compress&cs=tinysrgb&w=1600",fit:BoxFit.cover),)
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

            
           color: Colors.green.shade100, imageurl:"assets/WomenTravel.jpg" , subtitle:"Discover millons of places to stay your route", title: "Travel more your way",
           ),
           buildPage(
           color: Colors.blue.shade100, imageurl:"assets/menTravel.jpg" , subtitle:"When are here to help you to discover the world easily", title: "Discover The World",
           ),
           buildPage(
           color: Colors.amber.shade100, imageurl:"assets/Traveltime.jpg" , subtitle:"Get Ready Fast for Fall Leaf Viewing Trips", title: "Travel Time ",
           ),
          ],
          
        ),
      ),
      bottomSheet:isLastPage
      ?
      GestureDetector
        (
          
          
          
          
          
          onTap: ()async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>SiginIn()));
      
      
      
          },child:Container(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius:BorderRadius.all(Radius.circular(5))
            ),
            width: MediaQuery.of(context).size.width,
        height: 60, child: const Center(child: Text("Get Started",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),
      ):
      
      
      
      
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
TextButton(onPressed: ()=>_pageController.jumpToPage(2), child: const Text("SKIP")),
Center(child:SmoothPageIndicator(controller: _pageController, count: 3,effect: WormEffect(dotColor: Colors.black26,spacing: 16,activeDotColor: Colors.teal.shade700),
onDotClicked: (index) => _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),

),


),
TextButton(onPressed: ()=>_pageController.nextPage(duration: const Duration(milliseconds: 500), curve:Curves.easeInOut ), child: const Text("NEXT")),
  ],
),

      )
    );
  }
}
 