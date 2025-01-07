import 'package:dbms_project/constants/app_exports.dart';

class BrandDataProvider extends ChangeNotifier {
  bool _discountTap = true;

  bool get discountTab => _discountTap;

  void switchTab(bool value) {
    _discountTap = value;
    notifyListeners();
  }
}
