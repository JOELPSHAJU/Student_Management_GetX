import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:studentmanagementgetx/application/controllers/edir_student_controller/edit_student_controller.dart';
import 'package:studentmanagementgetx/application/controllers/homelist_controller/home_list_controller.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/core/constants/constants.dart';
import 'package:studentmanagementgetx/database/database_helper.dart';
import 'package:studentmanagementgetx/model/student_model.dart';
import 'package:studentmanagementgetx/presentation/edit_student_screen/widgets.dart';
import 'package:studentmanagementgetx/presentation/home_screen/home_screen.dart';
import 'package:studentmanagementgetx/widgets/save_button.dart';

class EditStudentScreen extends StatelessWidget {
  final controller = Get.put(EditStudentController());
  final Student student;

  EditStudentScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseHelper datahelp = DatabaseHelper();

    controller.initialize(student);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Edit Students',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GetBuilder<EditStudentController>(
              builder: (_) {
                return Form(
                  key: _.formKey,
                  child: ListView(
                    children: [
                      h10,
                      GestureDetector(
                          onTap: () async {
                            XFile? img = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            _.updateProfilePicturePath(img!.path);
                          },
                          child: Obx(
                            () => CircleAvatar(
                              radius: 80,
                              backgroundImage: _.profilePicturePath.isNotEmpty
                                  ? FileImage(
                                      File(_.profilePicturePath.toString()))
                                  : FileImage(File(student.profielPicture)),
                            ),
                          )),
                      h20,
                      TextFormField(
                        controller: _.nameController,
                        decoration: decorationeditfield(label: 'Student Name'),
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
                        controller: _.schoolNameController,
                        decoration: decorationeditfield(label: 'School name'),
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
                        controller: _.fatherNameController,
                        decoration: decorationeditfield(label: 'Fathers Name'),
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
                        controller: _.ageController,
                        decoration: decorationeditfield(label: 'Age'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Age';
                          } else {
                            return null;
                          }
                        },
                      ),
                      h20,
                      Savebutton(onTap: () {
                        _.formKey.currentState!.validate();
                        {
                          final name = _.nameController.text;
                          final schoolname = _.schoolNameController.text;
                          final fathername = _.fatherNameController.text;
                          final age = int.parse(_.ageController.text);

                          final updatedStudent = Student(
                            id: student.id,
                            name: name,
                            schoolname: schoolname,
                            fathername: fathername,
                            age: age,
                            profielPicture: _.profilePicturePath.isNotEmpty
                                ? _.profilePicturePath.toString()
                                : student.profielPicture,
                          );

                          datahelp.updateStudent(updatedStudent).then((id) {
                            if (id > 0) {
                              controller.showDialog();
                              Get.offAll(() => HomeScreen());
                              Get.find<HomeController>().refreshStudentList();
                            } else {
                              Get.showSnackbar(
                                const GetSnackBar(
                                  titleText: Text(
                                    'Failed',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  messageText: Text(
                                    'Failed to update student',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          });
                        }
                      }),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
