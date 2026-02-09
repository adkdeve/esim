import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color brandPurple = Color(0xFF4A3277);
  static const Color brandPurpleDark = Color(0xFF483073);
  static const Color lavenderLight = Color(0xFFE8DEF8);
  static const Color lavenderPale = Color(0xFFE0E7FF);
  static const Color softPurple = Color(0xFFBFAEE3);
  static const Color blueLight = Color(0xFFE2E6FF);
  static const Color pinkLight = Color(0xFFFFE5EA);
  static const Color greenLight = Color(0xFFE0F7E6);
  static const Color bluePale = Color(0xFFDFF1FF);
  static const Color yellowPale = Color(0xFFFFF7DB);
  static const Color badgeGreen = Color(0xFF43A047);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color dangerRed = Color(0xFFFF3B30);

  static const Color textDark = Color(0xFF1D1B20);
  static const Color textMuted = Color(0xFF49454F);
  static const Color textPurpleMuted = Color(0xFF5E4B8A);
  static const Color textSlate = Color(0xFF1E232C);
  static const Color textMediumGrey = Color(0xFF7D7D7D);
  static const Color textGrey = Color(0xFF757575);
  static const Color textGreyDark = Color(0xFF424242);
  static const Color textDisabled = Color(0xFFBDBDBD);

  static const Color inputFill = Color(0xFFF7F8F9);
  static const Color dividerLight = Color(0xFFE8ECF4);
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundAlt = Color(0xFFF9F9F9);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color black54 = Color(0x8A000000);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color white60 = Color(0x99FFFFFF);
  static const Color transparent = Color(0x00000000);

  static const Color grey = Color(0xFF9E9E9E);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey800 = Color(0xFF424242);

  static const Color blue = Color(0xFF2196F3);
  static const Color blueAccent = Color(0xFF448AFF);
  static const Color red = Color(0xFFF44336);
  static const Color redAccent = Color(0xFFFF5252);
}

class AppThemeData {
  static final AppThemeData _instance = AppThemeData._internal();

  factory AppThemeData() {
    return _instance;
  }

  AppThemeData._internal();

  final Color primary = const Color(0xff483073);
  final Color secondary = const Color(0xff0b143a);
  final Color backgroundClr = const Color(0xffFFFFFF);
  final Color navBackClr = const Color(0xff060E27);
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color grey = Colors.grey;
  final Color transparent = Colors.transparent;
  final Color yellow = Colors.yellow;
  final Color red = Colors.red;
  final Color orange = const Color(0xffD0624C);
  final Color getStartedButtonColor = const Color(0xff0C192B);
  final Color green = const Color(0xff0A6375);
  final Color surface = const Color(0xFFF2F2F2);
  final Color color25 = const Color(0xffF6F8FA);
  final Color color50 = const Color(0xffF9FAFB);
  final Color color100 = const Color(0xffF7F9FC);
  final Color color200 = const Color(0xffE2E8F0);
  final Color color300 = const Color(0xffCBD5E1);
  final Color color400 = const Color(0xff94A3B8);
  final Color color500 = const Color(0xff6B7280);
  final Color color600 = const Color(0xff475569);
  final Color color900 = const Color(0xff080A12);
  final Color textColor = const Color(0xFF081035);
  final Color textLightColor = const Color(0xff606060);
  final Color disableBtnBck = const Color(0xffECECEC);
  final Color disableBtntext = const Color.fromRGBO(4, 12, 34, 0.40);
  final Color jobTags = const Color.fromRGBO(246, 248, 250, 0.60);
  final Color unSelectedStar = const Color(0xffEDF1F7);
  final Color selectedStar = const Color(0xffD0624C);
  final Color borderFocused = const Color(0xffF87171);
  final Color borderUnfocused = const Color(0xffCBD5E1);
  final Color cursorColor = Colors.white;
  final Color cursorColorDark = Colors.white;

  // Dark Theme Colors
  final Color darkPrimary = const Color(0xFF1A73E8);
  final Color darkBackground = const Color(0xFF212121);
  final Color darkSurface = const Color(0xFF1E1E1E);
  final Color darkText = Colors.white;

  // Text Colors
  final Color textPrimary = const Color(0xFF212121);
  final Color textSecondary = const Color(0xff606060);
  final Color textHint = const Color(0xFF9E9E9E);
  final Color textDisabled = const Color(0xFFBDBDBD);

  // Error and Success Colors
  final Color error = Colors.redAccent;
  final Color success = Colors.green;

  // Box Decoration Color
  static Color lightBoxDecorationColor = const Color(0xFFECEFF1);
  static Color darkBoxDecorationColor = const Color(0xFF1E1E1E);

  bool isDarkMode = false;

  // Method to apply system UI style based on theme mode
  void applySystemUIOverlayStyle(ThemeMode themeMode) {
    if (isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: color600, // Status bar color for dark theme
        statusBarIconBrightness: Brightness.light, // Light icons for dark theme
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: secondary, // Status bar color for light theme
        statusBarIconBrightness: Brightness.light, // Dark icons for light theme
      ));
    }
  }

  // Light Theme
  ThemeData get light {
    final base = ThemeData.light();
    final colorScheme = ColorScheme.light(
      primary: primary,
      secondary: secondary,
      background: backgroundClr,
      surface: white,
      onPrimary: grey,
      onSecondary: black,
      onBackground: textColor,
      onSurface: textColor,
      error: error,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,

      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: backgroundClr,
        foregroundColor: black,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        selectedItemColor: primary,
        unselectedItemColor: grey,
        backgroundColor: navBackClr,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme.copyWith(
        bodyLarge: base.textTheme.bodyLarge!.copyWith(color: colorScheme.onBackground),
        labelLarge: base.textTheme.labelLarge!.copyWith(color: colorScheme.onPrimary),
      ),),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: colorScheme.onBackground,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        hintStyle: GoogleFonts.inter().copyWith(
          color: textSecondary,
        ),
        labelStyle: TextStyle(color: colorScheme.onSurface),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textSecondary),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: colorScheme.primary,
      ),
      snackBarTheme: base.snackBarTheme.copyWith(
        backgroundColor: colorScheme.primary,
      ),
      textSelectionTheme: base.textSelectionTheme.copyWith(
        selectionColor: secondary,
        cursorColor: primary,
      ),
        // switchTheme: SwitchThemeData(
        //   thumbColor: WidgetStateProperty.all(switchInactiveThumbColor),
        //   trackColor: WidgetStateProperty.all(switchInactiveTrackColor),
        //   activeTrackColor: WidgetStateProperty.all(switchActiveTrackColor),
        //   activeColor: WidgetStateProperty.all(switchActiveColor),
        // ),
        //
    );
  }

  // Dark Theme
  ThemeData get dark {
    final base = ThemeData.dark();
    final colorScheme = ColorScheme.dark(
      primary: darkPrimary,
      secondary: secondary,
      background: darkBackground,
      surface: darkBackground,
      onPrimary: darkText,
      onSecondary: darkText,
      onBackground: darkText,
      onSurface: darkText,
      error: error,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: color600,
        foregroundColor: white,
      ),
      textTheme: base.textTheme.copyWith(
        bodyLarge: base.textTheme.bodyLarge!.copyWith(color: colorScheme.onBackground),
        labelLarge: base.textTheme.labelLarge!.copyWith(color: colorScheme.onPrimary),
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: colorScheme.onBackground,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        hintStyle: GoogleFonts.inter().copyWith(
          color: color400,
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: colorScheme.secondary),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: colorScheme.primary),
        // ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
        ),
        labelStyle: TextStyle(color: colorScheme.onSurface),
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: colorScheme.primary,
      ),
      snackBarTheme: base.snackBarTheme.copyWith(
        backgroundColor: colorScheme.primary,
      ),
      textSelectionTheme: base.textSelectionTheme.copyWith(
        selectionColor: secondary,
        cursorColor: primary,
      ),
    );
  }
}
