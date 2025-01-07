import 'package:dbms_project/constants/app_exports.dart';

class DashboardProviders extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<DotNavigationBarItem> bottomBarItem = [
    DotNavigationBarItem(
      icon: const Icon(Icons.discount),
      selectedColor: AppTheme.red,
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.local_pizza),
      selectedColor: AppTheme.red,
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.local_activity),
      selectedColor: AppTheme.red,
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.support_agent),
      selectedColor: AppTheme.red,
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.person),
      selectedColor: AppTheme.red,
    ),
  ];
  final List<Widget> dashboardTabs = [
    const DiscountTab(),
    const FoodDiscountTab(),
    const EventsTab(),
    const SupportTab(),
    const ProfileTab(),
  ];
}
