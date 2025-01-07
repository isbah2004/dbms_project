import 'package:dbms_project/constants/app_exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode whatsappNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    whatsappNumberController.dispose();
    passwordController.dispose();
    whatsappNumberFocusNode.dispose();
    passwordFocusNode.dispose();
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
            child: Consumer<LoginProvider>(builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: context.height / 8)),
                    Center(
                      child: Image.asset(
                        'assets/images/one group lpogo2.png',
                        height: 120,
                      ),
                    ),
                    SizedBox(
                      height: context.height / 12,
                    ),
                    PhoneNumberField(
                      onChanged: (phone) {
                        provider.phoneCode = phone.countryCode;
                      },
                      enabled: !provider.loading,
                      hintText: 'Whatsapp Number',
                      controller: whatsappNumberController,
                      focusNode: whatsappNumberFocusNode,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(context, whatsappNumberFocusNode,
                            passwordFocusNode);
                      },
                    ),
                    SizedBox(
                      height: provider.loading ? 30 : 0,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                      validator: (p0) {
                        return Utils.validatePassword(p0!);
                      },
                      focusNode: passwordFocusNode,
                      enabled: !provider.loading,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordScreen()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              AppTheme.redText(context: context, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    PrimaryButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            provider.login(
                                context: context,
                                whatsAppNo: whatsappNumberController.text,
                                password: passwordController.text);
                          }
                        },
                        title: 'Login',
                        isLoading: provider.loading),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: AppTheme.redText(fontSize: 16, context: context),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
