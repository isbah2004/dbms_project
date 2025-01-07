import 'package:dbms_project/constants/app_exports.dart';

class SupportTab extends StatefulWidget {
  const SupportTab({super.key});

  @override
  State<SupportTab> createState() => _SupportTabState();
}

class _SupportTabState extends State<SupportTab> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Consumer<SupportProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Image.asset(
                    'assets/images/one group lpogo2.png',
                    height: 100,
                  ),
                  SizedBox(
                    height: context.height / 12,
                  ),
                  ReusableTextField(
                      enabled: true,
                      hintText: 'Title',
                      controller: usernameController,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: AppTheme.red,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: GoogleFonts.poppins(),
                      hintText: 'Message',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: context.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: Text(
                      'Send',
                      style: AppTheme.whiteText(fontSize: 20, isBold: true),
                    ),
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
