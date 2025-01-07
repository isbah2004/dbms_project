import 'package:dbms_project/constants/app_exports.dart';

class GreyBgField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final Color? fillColor;
  final int? maxLines;

  final Widget? prefix, suffix;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final bool? obscureText;

  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin, padding;

  const GreyBgField({
    super.key,
    this.hintText = 'Search Discounts',
    this.prefixIcon = Icons.search,
    this.fillColor,
    this.maxLines = 1,
    this.prefix,
    this.suffix,
    required this.controller,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
    this.obscureText,
    this.maxLength,
    this.inputFormatters,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
          filled: true,
          fillColor: fillColor ?? Theme.of(context).colorScheme.onPrimary,
          prefixIcon: prefix ?? Icon(prefixIcon),
          suffixIcon: suffix,
          hintStyle: AppTheme.darkText(context: context),
          hintText: hintText,
          contentPadding: padding,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
