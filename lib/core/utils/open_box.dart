import '/core/app_export.dart';

class HiveBox {
  static String user = 'User';
  static String appLanguage = 'AppLanguage';
  static String environment = 'Environment';

  static Future<void> initHive() async {
    await Hive.openBox(environment);
    await Hive.openBox(user);
    await Hive.openBox(appLanguage);
  }
}
