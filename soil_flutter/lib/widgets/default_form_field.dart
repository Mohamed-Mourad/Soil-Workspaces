import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final FormFieldValidator<String?> validate;
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final Function(String?)? onSubmitted;
  final Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool isClickable;
  final bool isPassword;
  final VoidCallback? suffixPressed;

  const DefaultFormField({
    super.key,
    required this.controller,
    required this.keyboard,
    required this.validate,
    required this.label,
    required this.prefix,
    this.suffix,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.isClickable = true,
    this.isPassword = false,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      style: TextStyle(
        color: colorScheme.onPrimary,
      ),
      decoration: InputDecoration(
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.onTertiary, width: 1.0),
            borderRadius:  BorderRadius.all(Radius.circular(15.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.onTertiary, width: 1.0),
          borderRadius:  BorderRadius.all(Radius.circular(15.0)),
        ),
        hintText: 'Tap to choose a date.',
        hintStyle: TextStyle(color: colorScheme.onTertiary),
        prefixIcon: Icon(
            prefix,
          color: colorScheme.onTertiary,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
      ),
    );
  }
}
