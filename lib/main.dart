import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newproject/util/const_utils.dart';
import 'Screens/main_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      title: Constants.appname,
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      // home: SafeArea(child: TimerImageDisplay()),

      home: const MainScreen(),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
