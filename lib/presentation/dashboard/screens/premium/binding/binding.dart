import '/core/app_export.dart';

class PremiumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PremiumController());
  }
}
