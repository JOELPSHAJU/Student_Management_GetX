import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:studentmanagementgetx/application/controllers/login_page_controller/login_page_controller.dart';
import 'package:studentmanagementgetx/core/colors/colors.dart';
import 'package:studentmanagementgetx/core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final LoginController logincontroller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<LoginController>(
          builder: (logincontroller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/student.jpg',
                  width: MediaQuery.of(context).size.width,
                ),
                h20,
                const Text(
                  'Student Management',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: AppColors.primaryColor),
                ),
                h10,
                const Text(
                  '- GetX -',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: AppColors.primaryColor),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
