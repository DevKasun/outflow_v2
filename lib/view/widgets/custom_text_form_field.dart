import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final String? Function(String?) onValidate;
  final void Function(String?) onSaved;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.isPassword,
    required this.onValidate,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF),
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF),
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.all(12),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xFF3D3D3D),
          fontSize: 16,
        ),
      ),
      obscureText: isPassword,
      validator: onValidate,
      onSaved: onSaved,
    );
  }
}
