import '/core/app_export.dart';

class EnvConfig {
  bool liveMode = false;
  Box env = Hive.box(HiveBox.environment);
  EnvConfig() {
    // env.clear();
  }
  String get ip {
    if (liveMode) {
      return "api.barcelonafind.com";
    } else {
      return "192.168.10.3";
    }
  }

  String get port {
    if (liveMode) {
      return "4000";
    } else {
      return "4000";
    }
  }

  String get hostname {
    if (liveMode) {
      return 'https://$ip/client';
    } else {
      return 'http://$ip:$port/client';
    }
  }

  String get socket {
    if (liveMode) {
      return 'https://$ip:$port';
    } else {
      return 'http://$ip:$port';
    }
  }

  String? get id => env.get('id');
  String? get token => env.get('token');
  String? get openai => env.get('openai',
      defaultValue: "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");
  String? get userType => env.get('userType');
  String? get lang => env.get('lang', defaultValue: 'en');

  initHive() {
    env = Hive.box(HiveBox.environment);
  }

  Future putAll(Map<dynamic, dynamic> entries) async {
    await env.putAll(entries);
  }

  Future clear() async {
    await env.clear();
  }
}
