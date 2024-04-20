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
        child:Image.asset(
              imageurl,
              fit: BoxFit.fill,
              width: double.infinity,
              excludeFromSemantics: true,
              ),
              ) ,
      const SizedBox(height: 40,),
     Text(title,style: const TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold)),
      const SizedBox(height: 24,),
      Container(
            padding: const EdgeInsets.symmetric(horizontal:100, ),
             child:Center(
              child: Text(subtitle,
                style: const TextStyle(color: Colors.black87,fontSize: 17),
                ),
              )
  )],
  )
);