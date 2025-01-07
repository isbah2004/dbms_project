import 'package:dbms_project/constants/app_exports.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isLoading;
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title,
                style: AppTheme.whiteText(fontSize: 20, isBold: false),
              ),
      ),
    );
  }
}
