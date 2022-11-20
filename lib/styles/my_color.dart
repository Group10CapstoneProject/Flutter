import 'package:flutter/material.dart';

class MyColor{

  /// use shade 500 as default when shade not specified
  ///
  /// for shade 50, 100, 900 is null. Do not use it.
  ///
  /// shade 200 = Primary.Lightest
  ///
  /// shade 300 = Primary.Lighter
  ///
  /// shade 400 = Primary.Light
  ///
  /// shade 500 = Primary.Base
  ///
  /// shade 600 = Primary.Dark
  ///
  /// shade 700 = Primary.Darker
  ///
  /// shade 800 = Primary.Darkest
  static MaterialColor primaryColor = const MaterialColor(
    0xFF52A1A4, 
    <int, Color>{
      200: Color(0xFFC4F5EB),
      300: Color(0xFF9FE3DA),
      400: Color(0xFF7DC8C4),
      500: Color(0xFF52A1A4),
      600: Color(0xFF3B838D),
      700: Color(0xFF296676),
      800: Color(0xFF1A4B5F),
    }
  );

  ///use shade 100 as default when shade not specified
  ///
  ///shade 100 = White.Base
  ///
  ///shade 200 = White.Dark
  ///
  ///shade 400 = White.Darker
  ///
  ///shade 700 = White.Darkest
  static MaterialAccentColor whiteColor = const MaterialAccentColor(
    0xFFFDFDFD,
    <int, Color>{
      100: Color(0xFFFDFDFD),
      200: Color(0xFFF4F4F4),
      400: Color(0xFFD3D3D3),
      700: Color(0xFFA9A9A9),
    }
  );

}