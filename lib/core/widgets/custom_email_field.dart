import 'package:flutter/material.dart';
import 'package:angler/core/utils/validators.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool enabled;

  const CustomEmailField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText = 'Enter your email',
    this.labelText = 'Email',
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      enabled: enabled,
      validator: validator ?? Validators.validateEmail,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4A90E2), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
