import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:studentmanagementgetx/presentation/splash_screen.dart/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                bodySmall: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
        home: SplashScreen(),
        title: 'Color.fromARGB(255, 0, 0, 0)gement');
  }
}
