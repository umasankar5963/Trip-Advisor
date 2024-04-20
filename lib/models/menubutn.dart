import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../util/const_utils.dart';

class MenuButn extends StatelessWidget {
  const MenuButn({
    super.key,
    required this.press,
    required this.riveOnInit,
  });
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Tooltip(
          message: 'Menu',
          child: Container(
              margin: const EdgeInsets.only(left: 16, top: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.whiteColorBg,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    )
                  ]),
              child: RiveAnimation.asset(
                'assets/rivassets/menu_button.riv',
                onInit: riveOnInit,
              )),
        ),
      ),
    );
  }
}
