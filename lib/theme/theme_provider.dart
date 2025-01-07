import 'package:dbms_project/constants/app_exports.dart';

class ThemeProvider with ChangeNotifier {
  final GetStorage _storage = GetStorage();
  final String _themeKey = 'isDarkMode';

  ThemeData _themeData = AppTheme.lightTheme;

  ThemeProvider() {
    _initializeTheme();
  }

  void _initializeTheme() async {
    final isDarkMode = _storage.read(_themeKey) ?? false;
    _themeData = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == AppTheme.darkTheme;

  void toggleTheme() {
    _themeData = isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme;
    _storage.write(_themeKey, isDarkMode);
    notifyListeners();
  }

  Brightness get currentBrightness =>
      isDarkMode ? Brightness.light : Brightness.dark;
  // String get currentLogo => isDarkMode ? ImageNames.logoDark : ImageNames.logo;
}
