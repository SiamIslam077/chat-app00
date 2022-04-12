import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor cRed = MaterialColor(
    0xffec2603,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffec2603), //10%
      100: Color(0xffc94832), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
  static const MaterialColor cGreen = MaterialColor(0xff095706, <int, Color>{
    50: Color(0xff26A922), //10%
    100: Color(0xff18F210), //20%
    200: Color(0xff0B7907), //30%
    300: Color(0xff095706), //40%
    400: Color(0xff094007), //50%
    500: Color(0xff55D75E), //60%
    600: Color(0xff95D599), //70%
    700: Color(0xff567858), //80%
    800: Color(0xff92DD77), //90%
    900: Color(0xff84F35C), //100%
  });
}
