import 'package:get/get.dart';
import 'package:studentmanagementgetx/presentation/home_screen/home_screen.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    gotoHome();
  }

  Future<void> gotoHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(HomeScreen());
  }
}
