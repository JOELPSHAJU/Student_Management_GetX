import 'package:flutter/material.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';

// ignore: non_constant_identifier_names
DecorationHomeSceen() {
  return const InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        color: AppColors.primaryColor,
      ),
      fillColor: Color.fromARGB(255, 255, 255, 255),
      contentPadding: EdgeInsets.all(15),
      filled: true,
      hintText: 'Search student here',
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 11, 43, 69), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      hintStyle: TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.bold));
}
