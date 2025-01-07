import 'package:dbms_project/constants/app_exports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProviders>(builder: (context, provider, child) {
      return Scaffold(
        endDrawer: const ProfileDrawer(),
        body: provider.dashboardTabs[provider.selectedIndex],
        bottomNavigationBar: DotNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            paddingR: EdgeInsets.only(
                bottom: context.height * 0.005, top: context.height * 0.005),
            margin: EdgeInsets.zero,
            marginR: EdgeInsets.only(
                left: context.width * 0.05, right: context.width * 0.05),
            dotIndicatorColor: AppTheme.red,
            selectedItemColor: AppTheme.red,
            unselectedItemColor: Colors.grey,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  offset: const Offset(3, 5),
                  blurRadius: 6),
            ],
            currentIndex: provider.selectedIndex,
            onTap: (index) {
              provider.changeIndex(index);
            },
            items: provider.bottomBarItem),
      );
    });
  }
}
