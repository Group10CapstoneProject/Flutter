import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryDark = const Color(0xFF3B838D);
Color primaryBase = const Color(0xFF52A1A4);
Color blackLighter = const Color(0xFF3D3D3D);
Color blackColor = const Color(0xFF000000);
Color whiteBase = const Color(0xFFFDFDFD);
Color subtitle = const Color(0xFF464646);

FontWeight regular = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w700;
FontWeight bold = FontWeight.w900;

TextStyle ksubtitle = GoogleFonts.nunito(
    fontSize: 14, letterSpacing: 0.25, fontWeight: semiBold, color: subtitle);

final TextStyle kHeading6 =
    GoogleFonts.roboto(fontSize: 20, fontWeight: medium, letterSpacing: 0.15);
final TextStyle kBody2 =
    GoogleFonts.roboto(fontSize: 14, color: blackLighter, letterSpacing: 0.25);
final TextStyle kButton =
    GoogleFonts.roboto(fontSize: 14, fontWeight: medium, letterSpacing: 1.25);
final TextStyle kSubtitle2 =
    GoogleFonts.roboto(fontSize: 14, fontWeight: medium, letterSpacing: 0.1);
