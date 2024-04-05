import '/core/app_export.dart';

class UploadProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadProfileController());
  }
}
