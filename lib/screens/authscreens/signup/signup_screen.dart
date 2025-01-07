import 'package:dbms_project/constants/app_exports.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FocusNode fullnameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode whatsappNumberFocusNode = FocusNode();

  final FocusNode emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullnameController.dispose();
    passwordController.dispose();
    whatsappNumberController.dispose();
    dobController.dispose();
    emailController.dispose();
    emailFocusNode.dispose();

    fullnameFocusNode.dispose();
    passwordFocusNode.dispose();
    whatsappNumberFocusNode.dispose();
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
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child:
                  Consumer<SignUpProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    const ButtonBack(),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/one group lpogo2.png',
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 50),
                    VisibleTextField(
                      enabled: !provider.loading,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, fullnameFocusNode, emailFocusNode);
                      },
                      hintText: 'Username',
                      controller: fullnameController,
                      focusNode: fullnameFocusNode,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    VisibleTextField(
                      enabled: !provider.loading,
                      validator: (p0) {
                        return Utils.validateEmail(p0!);
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, emailFocusNode, passwordFocusNode);
                      },
                      hintText: 'Email',
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PasswordTextField(
                      enabled: !provider.loading,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(context, passwordFocusNode,
                            whatsappNumberFocusNode);
                      },
                      validator: (value) {
                        return Utils.validatePassword(value!);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PhoneNumberField(
                      onChanged: (phone) {
                        provider.phoneCode = phone.countryCode;
                      },
                      focusNode: whatsappNumberFocusNode,
                      hintText: 'WhatsApp Number',
                      controller: whatsappNumberController,
                      enabled: !provider.loading,
                      onFieldSubmitted: (value) {},
                    ),
                    SizedBox(
                      height: provider.loading ? 30 : 13,
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
                        if (_formKey.currentState!.validate()) {
                          provider.register(
                            context: context,
                            fullName: fullnameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            whatsAppNo: whatsappNumberController.text,
                          );
                        }
                      },
                      title: 'Register',
                      isLoading: provider.loading,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        "Already have an Account? Login",
                        style: AppTheme.redText(context: context, fontSize: 16),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
