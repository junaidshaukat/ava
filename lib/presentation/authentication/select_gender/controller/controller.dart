import '/core/app_export.dart';

class SelectGenderController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.selectChallenge,
      );
    });
  }
}
