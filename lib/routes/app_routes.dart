import '/core/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static const String splash = initialRoute;

  static const String continueAs = '/continue_as';

  static const String uploadProfile = '/upload_profile';

  static const String registerName = '/register_name';

  static const String selectGender = '/select_gender';

  static const String selectChallenge = '/select_challenge';

  static const String dashboard = '/dashboard';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: continueAs,
      page: () => ContinueAsScreen(),
      bindings: const [],
    ),
    GetPage(
      name: uploadProfile,
      page: () => UploadProfileScreen(),
      bindings: const [],
    ),
    GetPage(
      name: registerName,
      page: () => RegisterNameScreen(),
      bindings: const [],
    ),
    GetPage(
      name: selectGender,
      page: () => SelectGenderScreen(),
      bindings: const [],
    ),
    GetPage(
      name: selectChallenge,
      page: () => SelectChallengeScreen(),
      bindings: const [],
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      bindings: const [],
    ),
  ];
}
