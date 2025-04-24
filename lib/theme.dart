import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1351B4);
  static const Color secondaryColor = Color(0xFF168821);

  static const Color backgroundColor = Colors.white;
  static const Color errorColor = Color(0xFFB00020);
  static const Color textColor = Colors.black87;

  static final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: textColor),
    bodyMedium: TextStyle(fontSize: 14, color: textColor),
    labelLarge: TextStyle(fontSize: 14, color: textColor),
    labelMedium: TextStyle(fontSize: 12, color: textColor),
    labelSmall: TextStyle(fontSize: 10, color: textColor),
  );

  static final ThemeData themeData = ThemeData(
    useMaterial3: true, 
    fontFamily: 'Rawline',
    primaryColor: primaryColor,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 4.0,
      titleTextStyle: textTheme.titleLarge,
      iconTheme: const IconThemeData(color: primaryColor),
    ),
    colorScheme: const ColorScheme(
      primary: primaryColor,
      primaryContainer: Color(0xFFC5D4EB),
      secondary: secondaryColor,
      secondaryContainer: Color(0xFF03DAC5),
      surface: Colors.white,
      error: errorColor, 
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white, 
      brightness: Brightness.light, 
    ),
  );
}

extension CustomColors on ThemeData {
  Color get primary90 => const Color(0xFF071d41);
  Color get primary80 => const Color(0xFF0C326F);
  Color get primary60 => const Color(0xFF155BCB);
  Color get primary50 => const Color(0xFF2670E8);
  Color get primary40 => const Color(0xFF5992ED);
  Color get primary30 => const Color(0xFF81AEFC);
  Color get primary20 => const Color(0xFFADCDFF);
  Color get primary10 => const Color(0xFFD4E5FF);
  Color get primary05 => const Color(0xFFEDF5FF);

  Color get secondary80 => const Color(0xFF19311E);
  Color get secondary70 => const Color(0xFF154C21);
  Color get secondary60 => const Color(0xFF216E1F);
  Color get secondary40 => const Color(0xFF00A91C);
  Color get secondary30 => const Color(0xFF21C834);
  Color get secondary20 => const Color(0xFF70E17B);
  Color get secondary10 => const Color(0xFFB7F5BD);
  Color get secondary05 => const Color(0xFFE3FAE1);

  Color get errorMessage => const Color(0xFFFDE0DB); 
  Color get textMessage => const Color(0xFF121212);
}
