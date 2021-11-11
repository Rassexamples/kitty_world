import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {

  static final ThemeData generalTheme = ThemeData.light().copyWith(
      primaryColor: Colors.pinkAccent,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      appBarTheme: ThemeData.light().appBarTheme,
      textTheme: ThemeData.light().textTheme.apply(
            bodyColor: Colors.black,
            fontFamily: GoogleFonts.metrophobic(letterSpacing: 2).fontFamily,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: colorPinkLow)));


  // Margin and padding
  static const EdgeInsets edge8 = EdgeInsets.all(8);
  static const EdgeInsets edge11 = EdgeInsets.all(11);
  static const EdgeInsets edge16 = EdgeInsets.all(16);
  static const EdgeInsets edge21 = EdgeInsets.all(21);
  //

  // Text size
  static const textStyleLarge21 = TextStyle(fontSize: 21);
  static const textStyleLarge18 = TextStyle(fontSize: 18);
  //

  // colors
  static Color colorPinkLow = Colors.pinkAccent.withOpacity(.7);
  static Color colorPinkLowest = Colors.pinkAccent.withOpacity(.2);
  static Color colorWhiteLow = Colors.white.withOpacity(.9);
  //


  static BoxShadow boxShadowBlack = BoxShadow(
      color: Colors.black54.withOpacity(.1), blurRadius: 1, spreadRadius: 1);

  static BorderRadius borderRadius = const BorderRadius.only(
    topRight: Radius.circular(12),
    topLeft: Radius.circular(0),
    bottomLeft: Radius.circular(2),
    bottomRight: Radius.circular(12),
  );

  static BoxDecoration boxDecorationWhite = BoxDecoration(
  color: AppTheme.colorWhiteLow,
  borderRadius: AppTheme.borderRadius,
  boxShadow: [
  AppTheme.boxShadowBlack,
  ]);
}
