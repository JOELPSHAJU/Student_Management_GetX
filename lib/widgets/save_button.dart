import 'package:flutter/material.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';

class Savebutton extends StatelessWidget {
  final Function()? onTap;
  const Savebutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(21),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
