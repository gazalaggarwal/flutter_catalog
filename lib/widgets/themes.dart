import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyTheme.darkBluishColor),
      colorScheme: const ColorScheme.light().copyWith(
        secondary: darkBluishColor,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 23),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyTheme.lightBluishColor),
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 23),
      ));

  //colors
  static Color creamColor = Color.fromARGB(255, 233, 226, 226);
  static Color darkcreamColor = Vx.gray800;
  static Color darkBluishColor = Color.fromARGB(255, 48, 43, 73);
  static Color lightBluishColor = Vx.blue600;
}
