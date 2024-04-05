import '/core/app_export.dart';

class SelectChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectChallengeController());
  }
}
