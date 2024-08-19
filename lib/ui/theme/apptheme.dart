import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get appTheme => ThemeData(
        colorScheme: colorScheme,
        primaryColor: Colors.blue,
        iconTheme: iconThemeData,
        elevatedButtonTheme: elevatedButonTheme,
        textTheme: textTheme,
        useMaterial3: true,
      );

  final textTheme = const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Color(0xFF46B264),
    ),
    titleSmall: TextStyle(
        fontSize: 11,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        color: Color(0xFF788A83)),
    headlineMedium: TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        color: Color(0xff1c282a)),
    labelMedium: TextStyle(
        fontSize: 11,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
        color: Color(
          0xFF1D292B,
        )),
    headlineSmall: TextStyle(
        fontSize: 13,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        color: Color(0xFF788A83)),
    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(
        0xFF999b9e,
      ),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color(0xff6d8475),
    ),
    displaySmall: TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        color: Color(0xFFFF5959)),
    labelSmall: TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: Color(0xFF788A83)),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF4C675D),
    ),
    bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: Color(0xFFFFFFFF)),
    displayLarge: TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        color: Color(0xFF1D292B)),
    headlineLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xff1c282a),
    ),
  );


  IconThemeData get iconThemeData =>
      const IconThemeData(color: Color(0xFF3240a8));

  ElevatedButtonThemeData get elevatedButonTheme => ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ));
}

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF4A67CC),
  background: Colors.white,
  secondary: Color(0xFF4C675D),
  surface: Colors.white,
  onBackground: Colors.black,
  onError: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Color(0xFF333654),
  primaryContainer: Color(0xFF6770A1),
  onPrimaryContainer: Colors.white,
  error: Color(0xFFFF596D),
);
