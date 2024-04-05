import '/core/app_export.dart';

class SelectGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectGenderController());
  }
}
