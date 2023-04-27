import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newproject/siginup.dart';

import 'homepage.dart';



class SiginIn extends StatefulWidget {
  const SiginIn({super.key});

  @override
  State<SiginIn> createState() => _SiginInState();
}

class _SiginInState extends State<SiginIn> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(
      
  
    // leading: const Icon(Icons.arrow_back_rounded),
    
    // ),
      body:Stack(
        children: 
          [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
           child: Image.network("https://images.pexels.com/photos/2310713/pexels-photo-2310713.jpeg?auto=compress&cs=tinysrgb&w=1600",colorBlendMode: BlendMode.darken,filterQuality: FilterQuality.high,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit:BoxFit.fill , color: Colors.grey.withOpacity(0.1),),),
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
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context) =>HomePage()));
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: MediaQuery.of(context).size.width - 48,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        "Sigin in",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





