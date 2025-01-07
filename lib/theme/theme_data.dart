import 'package:dbms_project/constants/app_exports.dart';

class AppTheme {
  static const Color lightGrey = Color(0xFFDFDFDF);
  static const Color grey = Color(0xFF757575);
  static const Color mediumGrey = Color(0xFFCDCDCD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF4CAF50);
  static const Color darkGrey = Color.fromARGB(255, 0, 0, 0);
  static const Color red = Color(0xFFC42737);
  static const Color transparent = Color(0x00000000);
  static TextStyle greenText({
    double? fontSize,
    bool? isBold,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 18,
      fontWeight: isBold ?? false ? FontWeight.w500 : FontWeight.normal,
      color: green,
    );
  }

  static TextStyle darkText({
    required context,
    double? fontSize,
    bool? isBold,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 18,
      fontWeight: isBold ?? false ? FontWeight.w500 : FontWeight.normal,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }

  static TextStyle whiteText({
    double? fontSize,
    bool? isBold,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 18,
      fontWeight: isBold ?? false ? FontWeight.w500 : FontWeight.normal,
      color: white,
    );
  }

  static TextStyle redText({
    double? fontSize,
    required context,
    bool? isBold,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 18,
      fontWeight: isBold ?? false ? FontWeight.w500 : FontWeight.normal,
      color: Theme.of(context).colorScheme.onTertiary,
    );
  }

  static TextStyle greyText({
    required context,
    double? fontSize,
    bool? isBold,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 18,
      fontWeight: isBold ?? false ? FontWeight.w500 : FontWeight.normal,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }

  static ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: darkGrey),
    colorScheme: const ColorScheme.light(
      onSurface: darkGrey, // Light grey for skeleton
      surface: white,
      primary: red,
      secondary: grey,
      onPrimary: Color(0xFFE0E0E0),
      tertiary: darkGrey,
      onTertiary: red,
      onSecondary: Color(0xFFFAFAFA),
      inversePrimary: darkGrey,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
  );
  static ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: lightGrey),
    colorScheme: ColorScheme.dark(
      onSurface: lightGrey,
      surface: const Color.fromARGB(255, 24, 24, 27),
      primary: red,
      secondary: Colors.black,
      tertiary: Colors.grey.shade300,
      onTertiary: Colors.grey.shade300,
      onPrimary: Colors.grey.shade900,
      onSecondary: const Color(0xFF191919),
      inversePrimary: lightGrey,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
  );
}
