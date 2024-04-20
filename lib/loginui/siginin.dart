import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newproject/loginui/siginup.dart';
import '../Widgets/loginbutton.dart';
import '../Screens/main_screen.dart';



class SiginIn extends StatefulWidget {
  const SiginIn({super.key});
  @override
  State<SiginIn> createState() => _SiginInState();
}

class _SiginInState extends State<SiginIn> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  
  bool signinOhever=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
             child:Image.asset('assets/loginbg.jpg',colorBlendMode: BlendMode.darken,filterQuality: FilterQuality.high,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit:BoxFit.fill , color: Colors.grey.withOpacity(0.1),),),
             // child: Image.network("https://i.pinimg.com/236x/56/a5/d7/56a5d7d229a22399865ac662a7aa2593.jpg",colorBlendMode: BlendMode.darken,filterQuality: FilterQuality.high,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit:BoxFit.fill , color: Colors.grey.withOpacity(0.1),),),
              Form(
               key: _formKey,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (val) {
                      return val!.isEmpty ? "Enter Email id" : null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                   const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration:  const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (val) {
                      return val!.isEmpty ? "Enter Password" : null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 24,),
                    LoginButn(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>MainScreen()));}, title: 'SignIn',
                    ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => SingnUp()));
                        },
                        child: const Text(  
                          "SingnUp",
                          style: TextStyle(
                              fontSize: 16, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  signinWithSocialMedia(),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
}

class signinWithSocialMedia extends StatefulWidget {
  const signinWithSocialMedia({super.key});

  @override
  State<signinWithSocialMedia> createState() => _signinWithSocialMediaState();
}

class _signinWithSocialMediaState extends State<signinWithSocialMedia> {
  bool onhoverd=false;
  bool fbonhoverd=false;

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          MouseRegion(
            onEnter: (_){
             setState(() {
              onhoverd=true;
             });
            },
            onExit:(_){
             setState(() {
               onhoverd=false;
             });
            },
            child: InkWell(
              onTap: (){},
              child: Container(height: 50, width: 120,
               decoration: BoxDecoration(
                color: onhoverd?const Color(0xff63B4FF):null,
                border: Border.all(color: const Color(0xff63B4FF),width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(30))
               ),
               child:Center(child: Text('Google',style: TextStyle(color: onhoverd?Colors.white:Colors.black),)),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          MouseRegion(
            onEnter: (_){
             setState(() {
               fbonhoverd=true;
             });
            },
            onExit:(_){
             setState(() {
               fbonhoverd=false;
             });
            },
            child: InkWell(
              onTap: (){},
              child: Container(height: 50, width: 120,
               decoration: BoxDecoration(
                color: fbonhoverd?const Color(0xff63B4FF):null,
                border: Border.all(color: const Color(0xff63B4FF),width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(30))
               ),
               child:Center(child: Text('Facebook',style: TextStyle(color: fbonhoverd?Colors.white:Colors.black),)),
              ),
            ),
          ),
         ],);
  }
}





