import 'package:dbms_project/constants/app_exports.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefix, suffix;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin, padding;
  final bool enabled;
  const ReusableTextField(
      {super.key,
      this.prefix,
      this.suffix,
      required this.hintText,
      required this.controller,
      this.focusNode,
      this.validator,
      this.onFieldSubmitted,
      required this.keyboardType,
      this.obscureText,
      this.maxLines = 1,
      this.maxLength,
      this.inputFormatters,
      this.margin,
      required this.enabled,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTheme.darkText(context: context, isBold: true),
        ),
        const SizedBox(height: 10),
        TextFormField(
          enabled: enabled,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          obscureText: obscureText ?? false,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          cursorColor: AppTheme.red,
          maxLength: maxLength,
          decoration: InputDecoration(
            suffixIconColor: Theme.of(context).colorScheme.inversePrimary,
            hintStyle: AppTheme.darkText(context: context),
            hintText: hintText,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
