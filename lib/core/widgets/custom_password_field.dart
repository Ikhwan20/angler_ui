import 'package:flutter/material.dart';
import 'package:angler/core/utils/validators.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool showStrengthIndicator;
  final bool enabled;

  const CustomPasswordField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText = 'Enter your password',
    this.labelText = 'Password',
    this.showStrengthIndicator = false,
    this.enabled = true,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscured = true;
  int _passwordStrength = 0;

  @override
  void initState() {
    super.initState();
    if (widget.showStrengthIndicator) {
      widget.controller.addListener(_updatePasswordStrength);
    }
  }

  @override
  void dispose() {
    if (widget.showStrengthIndicator) {
      widget.controller.removeListener(_updatePasswordStrength);
    }
    super.dispose();
  }

  void _updatePasswordStrength() {
    setState(() {
      _passwordStrength = Validators.getPasswordStrength(
        widget.controller.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          enabled: widget.enabled,
          validator: widget.validator ?? Validators.validatePassword,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
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
        ),

        // Password Strength Indicator
        if (widget.showStrengthIndicator &&
            widget.controller.text.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: _passwordStrength / 4,
                  backgroundColor: Colors.grey.shade200,
                  color: Validators.getPasswordStrengthColor(_passwordStrength),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                Validators.getPasswordStrengthLabel(_passwordStrength),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Validators.getPasswordStrengthColor(_passwordStrength),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Use 8+ characters with mix of letters, numbers & symbols',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ],
    );
  }
}
