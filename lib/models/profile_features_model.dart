// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileCat {
  String name;
 IconData icon;
  ProfileCat({
    required this.name,
    required this.icon,
  });
}

List<ProfileCat>profilefeatures=[
  ProfileCat(name: 'Notifications', icon:Icons.notifications_outlined,),
  ProfileCat(name: 'My Transactions', icon:Icons.wallet_outlined),
  ProfileCat(name: 'Offers', icon: Icons.discount_outlined),
  ProfileCat(name: 'Settings', icon: Icons.settings_outlined),
  ProfileCat(name: 'Share app', icon: Icons.share_outlined),
];