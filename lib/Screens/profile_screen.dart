// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:newproject/models/profile_features_model.dart';
import 'package:newproject/util/const_utils.dart';
import '../Widgets/rounded_icon_butn.dart';
import '../loginui/siginin.dart';
import 'main_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    late SMIBool userTrigger;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constants.lightPrimary,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedIconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: Constants.darkBG, size: 17),
                        message: 'Back',
                        ontap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MainScreen()));
                        },
                      ),
                      const Text(
                        'Profile',
                        style: Constants.categoeryheader,
                      ),
                      RoundedIconButton(
                        icon: Icon(Icons.border_color_outlined,
                            color: Constants.badgeColor, size: 17),
                        message: 'Edit',
                        ontap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Constants.darkPrimary,
                    radius: 50,
                    //child: Icon(Icons.person,color:Constants.textButncolor),
                    backgroundImage: const AssetImage('assets/naruto.jpeg'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Naruto uzamaki',
                    style: Constants.listTileTitle,
                  ),
                  const Text('naruto.uzamaki@gmail.com',
                      style: Constants.subtitle),
                  const Text(
                    '9526343461',
                    style: Constants.subtitle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Constants.dividerClr,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: profilefeatures.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 70,
                                  child: ListTile(
                                      leading: Icon(
                                        profilefeatures[index].icon,
                                        color: Constants.buttonscolor,
                                      ),
                                      title: Text(
                                        profilefeatures[index].name,
                                        style: Constants.listTileTitle,
                                      )),
                                );
                              })),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black54,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SiginIn()));
                    },
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Constants.buttonscolor,
                    ),
                    title: const Text(
                      'LogOut',
                      style: Constants.listTileTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
