import 'package:dbms_project/constants/app_exports.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final FocusNode whatsappNoFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    whatsappNumberController.dispose();
    whatsappNoFocusNode.dispose();
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
                  children: [
                    const ButtonBack(),
                    SizedBox(height: context.height / 8),
                    Center(
                      child: Image.asset(
                        'assets/images/one group lpogo2.png',
                        height: 120,
                      ),
                    ),
                    SizedBox(height: context.height / 10),
                    PhoneNumberField(
                      onChanged: (phone) {
                        provider.phoneCode = phone.countryCode;
                      },
                      focusNode: whatsappNoFocusNode,
                      hintText: 'WhatsApp Number',
                      controller: whatsappNumberController,
                      enabled: !provider.loading,
                      onFieldSubmitted: (value) {},
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onTap: () {
                        //TODO: Implement the logic for sending OTP
                        if (_formKey.currentState!.validate()) {
                          provider.whatsappNo = whatsappNumberController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OTPReceiverScreen(),
                            ),
                          );
                        }
                      },
                      title: 'Send OTP',
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
