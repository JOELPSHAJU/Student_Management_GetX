import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:studentmanagementgetx/application/controllers/homelist_controller/home_list_controller.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/core/constants/constants.dart';
import 'package:studentmanagementgetx/presentation/add_student/add_student.dart';
import 'package:studentmanagementgetx/presentation/home_screen/widgets.dart';
import 'package:studentmanagementgetx/presentation/student_details.dart/student_details.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        body: Obx(() {
          return Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  height: 140,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.primaryColor,
                    Color.fromARGB(255, 31, 161, 217)
                  ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.home,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Student Management',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                            style: const TextStyle(color: Colors.black),
                            onChanged: (query) {
                              controller.filterStudents(query);
                            },
                            decoration: DecorationHomeSceen()),
                      ),
                    ],
                  ),
                ),
                h10,
                controller.filteredStudents.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/student_prev_ui.png',
                              height: size.height * .3,
                            ),
                            const Center(
                                child: Text(
                              'No Students Found!',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: controller.filteredStudents.length,
                            itemBuilder: (context, index) {
                              final student =
                                  controller.filteredStudents[index];
                              return GestureDetector(
                                  onTap: () {
                                    Get.to(StudentDetailspage(student: student))
                                        ?.then((value) =>
                                            controller.refreshStudentList());
                                  },
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 55.0,
                                            backgroundColor: Colors.black,
                                            backgroundImage: FileImage(
                                                File(student.profielPicture)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${student.name} (${student.age})',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8),
                                              child: Text(
                                                student.schoolname,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }),
                      ),
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 7,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Get.to(AddStudent())!
                .then((value) => controller.refreshStudentList());
          },
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  AppColors.primaryColor,
                  Color.fromARGB(255, 31, 161, 217)
                ]),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
