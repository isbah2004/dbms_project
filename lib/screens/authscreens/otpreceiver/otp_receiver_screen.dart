import 'package:dbms_project/constants/app_exports.dart';

class OTPReceiverScreen extends StatelessWidget {
  const OTPReceiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<ResetPasswordProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const ButtonBack(),
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                Center(
                  child: Image.asset(
                    'assets/images/one group lpogo2.png',
                    height: 120,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: otpProvider.isResendEnabled
                      ? () {
                          otpProvider.startTimer();
                          // Add your resend OTP logic here
                        }
                      : null,
                  child: Text(
                    otpProvider.isResendEnabled
                        ? "Resend OTP"
                        : "Resend OTP in ${otpProvider.start} seconds",
                    style: AppTheme.redText(fontSize: 16, context: context),
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPasswordScreen()));
                    //TODO: Handle OTP verification logic here
                  },
                  title: 'Verify OTP',
                  isLoading: false,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
