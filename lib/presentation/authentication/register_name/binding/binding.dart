import '/core/app_export.dart';

class RegisterNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterNameController());
  }
}
