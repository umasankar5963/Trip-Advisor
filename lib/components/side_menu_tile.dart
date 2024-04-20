// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:newproject/models/bottom_navigation_model.dart';

import '../util/const_utils.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive,
  }) : super(key: key);
  final RiveAssets menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              height: 56,
              width: isActive ? 288 : 0.0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.sideMenuSltIndx,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: RiveAnimation.asset(
                    menu.src,
                    artboard: menu.artboard,
                    onInit: riveonInit,
                  )),
              title: Text(
                menu.title,
                style: TextStyle(color: Constants.whiteColorBg),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
