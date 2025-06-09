import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor = Color(0xFF1C1C2E);
  static const Color secondaryColor = Color(0xFFD96BFF);
  static const Color backgroundScaffold = Color(0xFF0F0F1A);
  static const Color borderColor = Color(0xFFFFD93D); 


  static final ThemeData darkMode = ThemeData(
    primaryColor:primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor ,
    ),
    scaffoldBackgroundColor: backgroundScaffold,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF6750a4),width: 2),borderRadius: BorderRadius.circular(40)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor,width: 3),borderRadius: BorderRadius.circular(40)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      labelStyle: TextStyle(color: Colors.white)
    ),
    cardColor: primaryColor
  );
}

class AppTextTheme{
  static const Color textFieldFontColor = Color(0xFFFFFFFF); 

  static const TextStyle appBarText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30
  );

  static const TextStyle fieldText = TextStyle(
    color: textFieldFontColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    
  );

  static const TextStyle formHeading =TextStyle(
    color: textFieldFontColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}