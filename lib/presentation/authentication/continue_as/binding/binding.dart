import '/core/app_export.dart';

class ContinueAsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContinueAsController());
  }
}
