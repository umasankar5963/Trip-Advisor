

 import 'package:flutter/material.dart';

buildPage({
  required Color color,
  required String title,
  required String subtitle,
  required String imageurl,
  
  
  
  }) =>

Container(
   color: Colors.white,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
SizedBox(
  height: 350,
  // decoration: BoxDecoration( color: Colors.green,

  //   borderRadius: BorderRadius.all(Radius.circular(1200))
  // ),
  child:   Image.asset(
  
    imageurl,
   
    fit: BoxFit.fill,
   
    width: double.infinity,
   excludeFromSemantics: true,
  ),
),
const SizedBox(height: 40,),
// Text(title,style: TextStyle(color: Colors.teal.shade700,fontSize: 32,fontWeight: FontWeight.bold)),
Text(title,style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold)),
    const SizedBox(height: 24,),
    Container(
     
      padding: const EdgeInsets.symmetric(horizontal:100, ),
      child:Center(
        child: Text(subtitle,
        // style: const TextStyle(color: Color.fromARGB(255, 140, 43, 42),fontSize: 17),
        style: const TextStyle(color: Colors.black87,fontSize: 17),
        ),
      )
    )
    
    ],
  )
);