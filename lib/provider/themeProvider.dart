import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class themeprovider extends ChangeNotifier {
 ThemeMode themeMode = ThemeMode.light;
 bool get isDarkeMode => themeMode == ThemeMode.dark;

 void toggleTheme (){
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
 }

}
class MyTheme{
  static final DarkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 22,fontWeight: FontWeight.bold ),
      bodySmall: GoogleFonts.ubuntu(color: Colors.white,fontSize: 15 ),
      labelSmall: GoogleFonts.ubuntu(color: Colors.white54,fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black54,fontSize: 12 ),
    ),

    unselectedWidgetColor: Colors.white70,
    primaryColorLight: Colors.black54,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.blueAccent[700],
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black,opacity: 0.8),


  );
  static final LightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold ),
      bodySmall: GoogleFonts.ubuntu(color: Colors.black,fontSize: 15 ),
      labelSmall: GoogleFonts.ubuntu(color: Colors.black38,fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black,fontSize: 12 ),
    ),

    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent[350],
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black,opacity: 0.8),


  );
}