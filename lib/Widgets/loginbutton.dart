// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../util/const_utils.dart';

class LoginButn extends StatefulWidget {
final   VoidCallback onTap;
final String title;
  const LoginButn({
    Key? key,
    required this.onTap, required this.title,
  }) : super(key: key);

  @override
  State<LoginButn> createState() => _LoginButnState();
}

class _LoginButnState extends State<LoginButn> {
  bool signinOhever=false;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                      onTap: widget.onTap,
                      child: MouseRegion(
                       onEnter: (_){
                        signinOhever=true;
                       setState(() {
                       
                       });
                       },
                       onExit: (_){
                       signinOhever=false;
                       setState(() {
                       
                        });
                        },
                       child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration:  BoxDecoration(
                            color: signinOhever?Constants.buttonscolor:null,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                           border: Border.all(color: signinOhever? Colors.blue:const Color(0xff63B4FF),width: 3.0),
                            ),
                        child:Text(
                          widget.title,
                          style: TextStyle(color:signinOhever? Colors.white:Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  );
  }
}