import 'package:flutter/material.dart';
import 'package:newproject/homepage.dart';
import 'package:newproject/siginin.dart';

import 'imagesdisplay/images.display.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
  
      ),
      home:SafeArea(child:ImageDisplayTimer()) ,
    );
  }
}

