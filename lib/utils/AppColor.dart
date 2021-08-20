import 'package:flutter/material.dart';

class AppColor {
  static MaterialColor primarySwatchColor = Colors.black;
  static MaterialColor errorColor = Colors.red;
  static MaterialColor disableColor = Colors.grey;

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color grey = Color(0xFFFAFAFA);
  static Color lightGrey = Color(0xFFF2F2F2);
  static Color grey2 = Color(0xFFB3B3B3);


  static const Color darkBlue = Color(0xff092E34);
  static const Color lightBlue = Color(0xff489FB5);
  static const Color orange = Color(0xffFFA62B);
  static const Color darkOrange = Color(0xffCC7700);
  static const Color materialAppColor = Color(0xFF5499C7);

  static int appColorPrimaryValue = 0xFF5499C7 ; //0xFFC70851;
  static MaterialColor appColor = MaterialColor(
    appColorPrimaryValue,
    <int, Color>{
      50: Color(0xFF65a3cd),
      100: Color(0xFF76add2),
      200: Color(0xFF87b8d8),
      300: Color(0xFF98c2dd),
      400: Color(0xFFaacce3),
      500: Color(0xFFbbd6e9),
      600: Color(0xFFcce0ee),
      700: Color(0xFFddebf4),
      800: Color(0xFFeef5f9),
      900: Color(0xFF5499C7),
    },
  );
}
