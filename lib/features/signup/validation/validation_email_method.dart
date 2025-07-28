import 'package:flutter/material.dart';

String? Function(String?) validationEmailMethod({
  required BuildContext context,
}) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid email format';
    }

    return null;
  };
}
