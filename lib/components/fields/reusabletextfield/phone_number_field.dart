import 'package:dbms_project/constants/app_exports.dart';

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? margin, padding;
  final bool enabled;
  final void Function(PhoneNumber)? onChanged;

  const PhoneNumberField({
    super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.margin,
    this.padding,
    required this.enabled,
    this.onChanged,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText,
            style: AppTheme.darkText(context: context, isBold: true),
          ),
          const SizedBox(height: 10),
          IntlPhoneField(
            enabled: widget.enabled,
            keyboardType: TextInputType.phone,
            controller: widget.controller,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              hintStyle: AppTheme.darkText(context: context),
              hintText: widget.hintText,
              contentPadding: widget.padding,
            ),
            initialCountryCode: 'PK',
            validator: widget.validator,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ], // Add this line
            onChanged: widget.onChanged,
            onSubmitted: widget.onFieldSubmitted,
          ),
        ],
      ),
    );
  }
}
