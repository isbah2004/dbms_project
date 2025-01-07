import 'package:dbms_project/constants/app_exports.dart';

class PasswordTextField extends StatefulWidget {
  final bool initialObscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin, padding;
  final bool enabled;
  const PasswordTextField({
    super.key,
    this.initialObscureText = true,
    required this.controller,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.margin,
    this.padding,
    required this.enabled,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late final ValueNotifier<bool> _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = ValueNotifier<bool>(widget.initialObscureText);
  }

  @override
  void dispose() {
    _obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureText,
      builder: (context, value, child) {
        return ReusableTextField(
          hintText: 'Password',
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: TextInputType.visiblePassword,
          obscureText: value,
          inputFormatters: widget.inputFormatters,
          margin: widget.margin,
          padding: widget.padding,
          suffix: IconButton(
            icon: Icon(
              value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              _obscureText.value = !_obscureText.value;
            },
          ),
          enabled: widget.enabled,
        );
      },
    );
  }
}
