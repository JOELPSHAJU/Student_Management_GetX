import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/database/database_helper.dart';
import 'package:studentmanagementgetx/model/student_model.dart';
import 'package:studentmanagementgetx/presentation/edit_student_screen/edit_student_screen.dart';
import 'package:studentmanagementgetx/widgets/delete_button.dart';

class StudentDetailController extends GetxController {
  late DatabaseHelper db;

  @override
  void onInit() {
    super.onInit();
    db = DatabaseHelper();
  }

  void deleteStudent(Student student) {
    Get.defaultDialog(
      title: 'Delete Student',
      content: const Text(
        'Are you sure you want to delete this student?',
        style: TextStyle(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      titlePadding: const EdgeInsets.only(top: 25, bottom: 10),
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      backgroundColor: AppColors.primaryColor,
      onConfirm: () {
        Get.snackbar(
          'Success',
          'Student added successfully',
          messageText: const Text(
            'Student Deleted Successfully',
            style: TextStyle(color: Colors.white),
          ),
          titleText: const Text(
            'Deleted',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
          isDismissible: true,
        );
        db.deleteStudent(student.id);
        Get.until((route) => Get.currentRoute == '/HomeScreen');
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void editStudent(Student student) {
    Get.to(() => EditStudentScreen(student: student))?.then((_) => Get.back());
  }

  void showCustomDialog(Student student) {
    Get.dialog(DeleteDialog(onCancel: () {
      Get.back();
    }, onDelete: () {
      Get.snackbar(
        'Success',
        'Student added successfully',
        messageText: const Text(
          'Student Deleted Successfully',
          style: TextStyle(color: Colors.white),
        ),
        titleText: const Text(
          'Deleted',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        isDismissible: true,
      );

      db.deleteStudent(student.id);
      Get.until((route) => Get.currentRoute == '/HomeScreen');
    }));
  }
}
