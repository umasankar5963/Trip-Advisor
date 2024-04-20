import 'package:flutter/material.dart';

import '../util/const_utils.dart';

class RoundedIconButton extends StatelessWidget {
  String message;
  VoidCallback ontap;
  Icon icon;

   RoundedIconButton({
    Key? key,
    required this.message,
    required this.ontap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
                        message:message,
                        child: Card(
                          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))) ,
                          color: Constants.lightPrimary,
                          elevation: 8,
                          child: InkWell(
                            onTap: ontap,
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: icon),
                          )),
                      );

  }
}
