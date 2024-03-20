import 'package:flutter/material.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    // Light Theme
    return ThemeData(
      // Primary Color
      primaryColor: AppColors.primaryColor,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: Colors.blueAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        onBackground: AppColors.primaryColor,
        onSurface: AppColors.blackColor,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 4,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 10,
        iconTheme: IconThemeData(color: AppColors.whiteColor,size: 20),
      //    actionsIconTheme :IconThemeData(color: AppColors.whiteColor),
      ),

      // Button Theme
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
      ),

      // Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold) ,
        labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
      ),

      // Input Decoration Theme (for text fields)
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color:AppColors.greyWalaShade),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        disabledBorder: InputBorder.none,
        outlineBorder: const BorderSide(
        color: AppColors.primaryColor),
        ),



      // Card Theme
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(8),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      //  checkColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
        trackColor: MaterialStateProperty.all(AppColors.primaryColor.withOpacity(0.5)),
      ),

      // TabBar Theme
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: AppColors.primaryColor.withOpacity(0.3),
        thumbColor: AppColors.primaryColor,
        overlayColor: AppColors.primaryColor.withOpacity(0.2),
        trackHeight: 4.0,
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.grey[800],
        actionTextColor: AppColors.primaryColor,
        contentTextStyle: const TextStyle(color: Colors.white),
      ),

      // Dialog Theme
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),

      // Other customizations...
    );
  }

  // Similar customizations can be made for darkTheme
  static ThemeData get darkTheme {
    // Dark Theme
    return ThemeData(
      // Customize similar components for the dark theme
      // ...
    );
  }
}
