// ignore_for_file: must_be_immutable, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:studentmanagementgetx/application/controllers/add_student_controller/add_student_controller.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/core/constants/constants.dart';
import 'package:studentmanagementgetx/database/database_helper.dart';
import 'package:studentmanagementgetx/model/student_model.dart';
import 'package:studentmanagementgetx/presentation/add_student/widgets.dart';
import 'package:studentmanagementgetx/widgets/save_button.dart';

class AddStudent extends StatelessWidget {
  final AddStudentController controller = Get.put(AddStudentController());

  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _schoolnameController = TextEditingController();
  final _fathernamecontroller = TextEditingController();

  AddStudent({super.key});

  DatabaseHelper databasehelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'Add Students',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  GestureDetector(
                      onTap: () async {
                        XFile? img = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        controller.updateProfilePicturePath(img!.path);
                      },
                      child: Obx(
                        () => CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColors.primaryColor,
                          backgroundImage: controller
                                  .profilePicture.value.isNotEmpty
                              ? FileImage(File(controller.profilePicture.value))
                              : null,
                          child: controller.profilePicture.value.isEmpty
                              ? const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 35,
                                )
                              : null,
                        ),
                      )),
                  h20,
                  TextFormField(
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: _nameController,
                    onChanged: controller.updateName,
                    decoration: decorationaddfield(label: 'Student Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Student Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  h20,
                  TextFormField(
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: _schoolnameController,
                    onChanged: controller.updateSchoolName,
                    decoration: decorationaddfield(label: 'School Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter The school Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  h20,
                  TextFormField(
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: _fathernamecontroller,
                    onChanged: controller.updateFatherName,
                    decoration: decorationaddfield(label: 'Father Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Father Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  h20,
                  TextFormField(
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: _ageController,
                    onChanged: (value) => controller.updateAge(value),
                    decoration: decorationaddfield(label: 'Age'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Age';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  h40,
                  Savebutton(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        final name = controller.name.value;
                        final school = controller.Schoolname.value;
                        final father = controller.fathername.value;
                        final age = controller.age.value;

                        final student = Student(
                          id: 0,
                          name: name,
                          schoolname: school,
                          fathername: father,
                          age: age,
                          profielPicture: controller.profilePicture.value,
                        );
                        controller.clearImage();
                        databasehelper.insertStudent(student).then((id) {
                          if (id > 0) {
                            Get.back();
                            controller.saveStudent();
                          } else {
                            Get.snackbar(
                              'Failed',
                              'Failed to add student',
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.TOP,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 3),
                            );
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
