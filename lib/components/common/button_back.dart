import 'package:dbms_project/constants/app_exports.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: const Icon(
            size: 30,
            Icons.arrow_back_ios,
            color: AppTheme.red,
          ),
        ),
        InkWell(
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text(
            'Back',
            style:
                AppTheme.darkText(context: context, isBold: true, fontSize: 23),
          ),
        ),
      ],
    );
  }
}
