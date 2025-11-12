import 'package:flutter/material.dart';

class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Email regex pattern
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null; // null means valid
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null; // null means valid
  }

  // Password strength check (returns 0-4)
  static int getPasswordStrength(String password) {
    if (password.isEmpty) return 0;

    int strength = 0;

    // Check length
    if (password.length >= 8) strength++;
    if (password.length >= 12) strength++;

    // Check for lowercase
    if (password.contains(RegExp(r'[a-z]'))) strength++;

    // Check for uppercase
    if (password.contains(RegExp(r'[A-Z]'))) strength++;

    // Check for numbers
    if (password.contains(RegExp(r'[0-9]'))) strength++;

    // Check for special characters
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    // Normalize to 0-4 scale
    if (strength >= 5) return 4; // Very Strong
    if (strength >= 4) return 3; // Strong
    if (strength >= 3) return 2; // Medium
    if (strength >= 2) return 1; // Weak
    return 0; // Very Weak
  }

  // Get password strength label
  static String getPasswordStrengthLabel(int strength) {
    switch (strength) {
      case 0:
        return 'Very Weak';
      case 1:
        return 'Weak';
      case 2:
        return 'Medium';
      case 3:
        return 'Strong';
      case 4:
        return 'Very Strong';
      default:
        return '';
    }
  }

  // Get password strength color
  static Color getPasswordStrengthColor(int strength) {
    switch (strength) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.lightGreen;
      case 4:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Password match validation (for confirm password)
  static String? validatePasswordMatch(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  // Phone number validation (basic)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Basic phone validation (10-15 digits)
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,15}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
