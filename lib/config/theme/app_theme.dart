import '../../core/constants/export.dart';

class AppTheme {
  static ThemeData ligthThemeData = ThemeData(
    useMaterial3: false,
    fontFamily: GoogleFonts.inter().fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(color: AppColors.blackColor),
  );

  static ThemeData dartThemeData = ThemeData(
    useMaterial3: false,
    fontFamily: GoogleFonts.inter().fontFamily,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: textTheme,
  );
}
