import 'package:dbms_project/constants/app_exports.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider image = const NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7Qph8rkk_csy9IMEaAcX09DYGp-ayZ_OFEg&s');

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 62,
              backgroundColor: AppTheme.red,
              child: CircleAvatar(
                backgroundImage: image,
                radius: 60,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'John Doe',
              style: AppTheme.darkText(
                  context: context, fontSize: 18, isBold: true),
            ),
            Text(
              '92345623344',
              style: AppTheme.darkText(
                  context: context, fontSize: 14, isBold: true),
            ),
            Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Edit Profile',
                style: AppTheme.darkText(context: context, fontSize: 16),
              ),
              onTap: () {
                // Handle edit profile tap
              },
            ),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Chat with Us',
                style: AppTheme.darkText(context: context, fontSize: 16),
              ),
              onTap: () {
                // Handle chat with us tap
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star_rate,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Rate Us',
                style: AppTheme.darkText(context: context, fontSize: 16),
              ),
              onTap: () {
                // Handle rate us tap
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Sign Out',
                style: AppTheme.darkText(context: context, fontSize: 16),
              ),
              onTap: () {
                // Handle sign out tap
              },
            ),
            SwitchListTile(
              title: Text(
                'Dark Theme',
                style: AppTheme.darkText(context: context, fontSize: 16),
              ),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (bool value) {
                // Handle theme toggle
              },
            ),
          ],
        ),
      ),
    );
  }
}
