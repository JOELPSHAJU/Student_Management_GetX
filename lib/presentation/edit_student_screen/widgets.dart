import 'package:flutter/material.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';

decorationeditfield({required String label}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(50),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(50),
    ),
    label: Text(label),
  );
}
