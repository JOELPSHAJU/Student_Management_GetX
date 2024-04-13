import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:studentmanagementgetx/application/controllers/student_detail_controller/student_detail_controller.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/core/constants/constants.dart';
import 'package:studentmanagementgetx/model/student_model.dart';

class StudentDetailspage extends StatelessWidget {
  final StudentDetailController controller = Get.put(StudentDetailController());
  final Student student;

  StudentDetailspage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Student Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                //controller.deleteStudent(student);
                controller.showCustomDialog(student);
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                controller.editStudent(student);
              },
            ),
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        body: Column(
          children: [
            h10,
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(student.profielPicture)),
                  ),
                ),
              ),
            ),
            h20,
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h10,
                    Details(student: student.name, label: 'Name', size: size),
                    h10,
                    Details(
                        size: size,
                        student: student.schoolname,
                        label: 'School Name'),
                    h10,
                    Details(
                        size: size,
                        student: student.fathername,
                        label: "Father's Name"),
                    h10,
                    Details(
                        size: size,
                        student: student.age.toString(),
                        label: 'Age'),
                    h10,
                    const SizedBox(
                      width: 63,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details(
      {super.key,
      required this.student,
      required this.label,
      required this.size});

  final String student;
  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2, color: Colors.grey)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$label : ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(
                child: Text(
                  student,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
