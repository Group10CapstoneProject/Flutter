import 'package:flutter/material.dart';

class MyTextStyle{

  /// Do not use other than listed below because it is null
  ///
  /// headline1 = Header.Heading 1
  /// 
  /// headline2 = Header.Heading 2
  /// 
  /// headline3 = Header.Heading 3
  /// 
  /// headline4 = Header.Heading 4
  /// 
  /// headline5 = Header.Heading 5
  /// 
  /// headline6 = Header.Heading 6
  /// 
  /// subtitle1 = Subtitle.Subtitle 1
  /// 
  /// subtitle2 = Subtitle.Subtitle 2
  /// 
  /// bodyText1 = Body.Body 1
  /// 
  /// bodyText2 = Body.Body 2
  /// 
  /// button = Button
  /// 
  /// caption = Caption
  /// 
  /// overline = Overline
  static TextTheme textStyle = const TextTheme(

    headline1: TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
    headline2: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
    headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),

    subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

    bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

    button: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,),
    caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),

  );
}