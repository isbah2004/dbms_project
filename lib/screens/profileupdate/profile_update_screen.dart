import 'package:dbms_project/constants/app_exports.dart';
import 'package:dbms_project/provider/profileprovider/profile.dart';

class ProfileUpdateScreen extends StatefulWidget {
  final String initialFullname;

  final String initialDob;
  final String initialLocation;
  final String initialGender;

  const ProfileUpdateScreen({
    super.key,
    required this.initialFullname,
    required this.initialDob,
    required this.initialLocation,
    required this.initialGender,
  });

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  late TextEditingController fullnameController;
  late TextEditingController dobController;
  late TextEditingController locationController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    fullnameController = TextEditingController(text: widget.initialFullname);
    dobController = TextEditingController(text: widget.initialDob);
    locationController = TextEditingController(text: widget.initialLocation);
    genderController = TextEditingController(text: widget.initialGender);
  }

  @override
  void dispose() {
    fullnameController.dispose();
    dobController.dispose();
    locationController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child:
                Consumer<ProfileProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                  const ButtonBack(),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/one group lpogo2.png',
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 50),
                  VisibleTextField(
                    enabled: !provider.loading,
                    onFieldSubmitted: (value) {},
                    hintText: 'Username',
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        dobController.text =
                            "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
                        provider.dateOfBirth = dobController.text;
                      }
                    },
                    child: AbsorbPointer(
                      child: VisibleTextField(
                        suffix: const Icon(Icons.arrow_drop_down),
                        hintText: 'Date of Birth',
                        controller: dobController,
                        keyboardType: TextInputType.datetime,
                        onFieldSubmitted: (p0) {},
                        enabled: !provider.loading,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ReusableDropdownField(
                    hintText: 'Location',
                    value: provider.location,
                    items: Constants.areas,
                    onChanged: (String? newValue) {
                      provider.location = newValue!;
                    },
                    enabled: !provider.loading,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Gender Field
                  ReusableDropdownField(
                    hintText: 'Gender',
                    value: provider.gender,
                    items: Constants.genders,
                    onChanged: (String? newValue) {
                      provider.gender = newValue!;
                    },
                    enabled: !provider.loading,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  PrimaryButton(
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   log(whatsappNumberController.text.toString());
                      // }
                    },
                    title: 'Submit',
                    isLoading: provider.loading,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
