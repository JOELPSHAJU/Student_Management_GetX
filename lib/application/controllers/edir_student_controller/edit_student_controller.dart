import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentmanagementgetx/model/student_model.dart';

class EditStudentController extends GetxController {
  RxString profilePicturePath = ''.obs;
  RxString name = ''.obs;
  RxString schoolName = ''.obs;
  RxString fatherName = ''.obs;
  RxInt age = 0.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final ageController = TextEditingController();

  // Store initial values
  late String initialName;
  late String initialSchoolName;
  late String initialFatherName;
  late int initialAge;

  void initialize(Student student) {
    initialName = student.name;
    initialSchoolName = student.schoolname;
    initialFatherName = student.fathername;
    initialAge = student.age;

    // Set initial values to controllers
    nameController.text = initialName;
    schoolNameController.text = initialSchoolName;
    fatherNameController.text = initialFatherName;
    ageController.text = initialAge.toString();
  }

  void updateProfilePicturePath(String path) {
    profilePicturePath.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchoolName(String value) {
    schoolName.value = value;
  }

  void updateFatherName(String value) {
    fatherName.value = value;
  }

  void updateAge(String value) {
    age.value = int.parse(value);
  }

  showDialog() {
    Get.snackbar(
      'Success',
      'Student updated successfully',
      messageText: const Text(
        'Student updated successfully',
        style: TextStyle(color: Colors.white),
      ),
      titleText: const Text(
        'Success',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
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
  }
}
