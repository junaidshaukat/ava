import '/core/app_export.dart';

class RegisterNameController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.selectGender,
      );
    });
  }
}
