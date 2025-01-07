import 'app_exports.dart';

extension  Values on BuildContext {
  double get height => MediaQuery .of(this).size.height;
  double get width =>MediaQuery.of(this).size.width;
}
