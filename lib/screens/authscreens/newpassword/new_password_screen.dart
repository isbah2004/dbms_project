import 'package:dbms_project/constants/app_exports.dart';

List<UserData> userData = [];

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordController.dispose();

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
              child: Consumer<ResetPasswordProvider>(
                  builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ButtonBack(),
                    SizedBox(height: context.height / 8),
                    Center(
                      child: Image.asset(
                        'assets/images/one group lpogo2.png',
                        height: 120,
                      ),
                    ),
                    // Text(
                    //   textAlign: TextAlign.left,
                    //   'Enter you New Password',
                    //   style: AppTheme.darkText(
                    //       context: context, fontSize: 18, isBold: true),
                    // ),
                    SizedBox(height: context.height / 10),
                    PasswordTextField(
                        validator: (value) {
                          return Utils.validatePassword(value!);
                        },
                        controller: passwordController,
                        enabled: !provider.loading),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          provider.resetPassword(
                              context: context,
                              password: passwordController.text);
                        }
                      },
                      title: 'Submit',
                      isLoading: false,
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
