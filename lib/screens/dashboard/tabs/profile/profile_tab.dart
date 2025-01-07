import 'package:image_picker/image_picker.dart';
import 'package:dbms_project/constants/app_exports.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    UserData user = DataStore.userProfile();
    List<String> values = [
      user.fullName,
      user.whatsAppNo,
      user.dateOfBirth,
      user.location,
      user.gender
    ];
    List<String> keys = [
      'Username',
      'WhatsApp Number',
      'Date of Birth',
      'Location',
      'Gender'
    ];
    ImageProvider image = const NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7Qph8rkk_csy9IMEaAcX09DYGp-ayZ_OFEg&s');
    return Stack(
      children: [
        Image.asset(
          'assets/images/profile_background.jpg',
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: context.width,
                        height: context.height / 4.5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: const Icon(
                                Icons.menu,
                                color: AppTheme.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: context.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileUpdateScreen(
                                                  initialFullname:
                                                      user.fullName,
                                                  initialDob: user.dateOfBirth,
                                                  initialLocation:
                                                      user.location,
                                                  initialGender: user.gender,
                                                )));
                                  },
                                  child: CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      child: const Icon(Icons.edit)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(keys.length, (index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(Icons.person,
                                              color: AppTheme.red),
                                          title: Text(
                                            keys[index],
                                            style: AppTheme.darkText(
                                                context: context, isBold: true),
                                          ),
                                          subtitle: Text(
                                            values[index],
                                            style: AppTheme.greyText(
                                                context: context, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.height / 6.5),
                    child: Consumer<ProfileProvider>(
                        builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          provider.pickImage(ImageSource.gallery);
                        },
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 72,
                              backgroundColor: AppTheme.red,
                              child: CircleAvatar(
                                backgroundImage: image,
                                radius: 70,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
