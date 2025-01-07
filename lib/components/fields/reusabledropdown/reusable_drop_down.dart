import 'package:dbms_project/constants/app_exports.dart';

class ReusableDropdownField extends StatelessWidget {
  final String hintText;
  final String? value;
  final List<String> items;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String?)? onChanged;
  final bool enabled;

  const ReusableDropdownField({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.focusNode,
    required this.enabled,
  });

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
        DropdownButtonFormField<String>(
          style: AppTheme.darkText(context: context),
          validator: validator,
          focusNode: focusNode,
          menuMaxHeight: context.height / 1.7,
          decoration: InputDecoration(
            hintStyle: AppTheme.darkText(context: context),
            hintText: hintText,
          ),
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          icon: Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ],
    );
  }
}
