import 'package:get/get.dart';
import 'package:studentmanagementgetx/database/database_helper.dart';
import 'package:studentmanagementgetx/model/student_model.dart';

class HomeController extends GetxController {
  RxBool isSearching = false.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filteredStudents = <Student>[].obs;
  late DatabaseHelper databasehelper;

  @override
  void onInit() {
    databasehelper = DatabaseHelper();
    refreshStudentList();
    super.onInit();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databasehelper.getStudents();
    students.assignAll(studentList);
    filteredStudents.assignAll(studentList);
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents.assignAll(students);
    } else {
      filteredStudents.assignAll(students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  void toggleSearch() {
    isSearching.toggle();
    if (!isSearching.isTrue) {
      filteredStudents.assignAll(students);
    }
  }
}
