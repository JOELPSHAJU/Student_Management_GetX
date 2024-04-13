import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {
  RxString profilePicture = ''.obs;
  RxString name = ''.obs;
  // ignore: non_constant_identifier_names
  RxString Schoolname = ''.obs;
  RxString fathername = ''.obs;
  RxInt age = 0.obs;

  get fatherName => null;

  void updateProfilePicturePath(String path) {
    profilePicture.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchoolName(String value) {
    Schoolname.value = value;
  }

  void updateFatherName(String value) {
    fathername.value = value;
  }

  void updateAge(String value) {
    age.value = int.parse(value);
  }

  void clearImage() {
    profilePicture.value = '';
  }

  @override
  void onClose() {
    clearImage();
    super.onClose();
  }

  saveStudent() {
    Get.snackbar(
      'Success',
      'Student added successfully',
      messageText: const Text(
        'Student added successfully',
        style: TextStyle(color: Colors.white),
      ),
      titleText: const Text(
        'Success',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
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
