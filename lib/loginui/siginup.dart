import 'dart:ui';
import 'package:flutter/material.dart';
import '../Widgets/loginbutton.dart';
import 'siginin.dart';

class SingnUp extends StatefulWidget {
  const SingnUp({super.key});

  @override
  State<SingnUp> createState() => _SingnUpState();
}

class _SingnUpState extends State<SingnUp> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
             BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child:Image.asset('assets/loginbg.jpg',colorBlendMode: BlendMode.darken,filterQuality: FilterQuality.high,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit:BoxFit.fill , color: Colors.grey.withOpacity(0.1),),),
               //child: Image.network("https://images.pexels.com/photos/2310713/pexels-photo-2310713.jpeg?auto=compress&cs=tinysrgb&w=1600",colorBlendMode: BlendMode.darken,filterQuality: FilterQuality.high,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit:BoxFit.fill , color: Colors.grey.withOpacity(0.1),),),
            Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                    validator: (val) {
                      return val!.isEmpty ? "Enter Name" : null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (val) {
                      return val!.isEmpty ? "Enter Email id" : null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
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
                 LoginButn(title: 'SignUp',onTap: (){},),
                  const SizedBox( height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => SiginIn()));
                        },
                        child: const Text(
                          "SingnIn",
                          style: TextStyle(
                              fontSize: 16, decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox( height: 80,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
