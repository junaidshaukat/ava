import '/core/app_export.dart';

class DashboardController extends GetxController {
  SpeechToText speech = SpeechToText();

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      // Get.offNamed(
      //   AppRoutes.continueAs,
      // );
    });
  }

  void speechRecognition() async {
    try {
      bool isGranted = await Permission.speech.isGranted;

      if (!isGranted) {
        PermissionStatus permissionStatus = await Permission.speech.request();
        if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
          throw CustomException(
            key: "permission",
            strict: true,
            message: "user denied access speech permission",
          );
        }
      }

      await speech.initialize(
        debugLogging: true,
        finalTimeout: const Duration(seconds: 30),
        onError: (error) {
          console.log(error, name: 'initialize onError');

          throw CustomException(
            key: "speech initialize",
            strict: true,
            message: error.errorMsg,
          );
        },
        onStatus: (status) {
          console.log(status, name: 'initialize onStatus');
        },
      );

      if (!speech.isAvailable) {
        throw CustomException(
          key: "speech initialize",
          strict: true,
          message: "user denied access speech permission",
        );
      }

      await speech.listen(
        listenFor: const Duration(seconds: 30),
        listenOptions: SpeechListenOptions(
          cancelOnError: false,
          listenMode: ListenMode.search,
        ),
        onResult: (result) {
          console.log(result.toJson(), name: 'onResult');
        },
        onSoundLevelChange: (level) {
          console.log(level, name: 'onSoundLevelChange');
        },
      );
    } catch (error) {
      console.log('Recognition result: $error', name: 'catch');
    }
  }

  void stopSpeechRecognition() {
    speech.stop();
  }

  void disposeSpeechRecognition() {
    speech.cancel();
  }
}
