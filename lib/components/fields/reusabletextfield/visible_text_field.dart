import 'package:dbms_project/constants/app_exports.dart';

class VisibleTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  final Widget? prefix, suffix;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin, padding;
  final bool enabled;
  const VisibleTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.obscureText,
    this.maxLines = 1,
    this.inputFormatters,
    this.margin,
    this.padding,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextField(
          enabled: enabled,
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          prefix: prefix,
          suffix: suffix,
          focusNode: focusNode,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          margin: margin,
          padding: padding,
        ),
      ],
    );
  }
}
