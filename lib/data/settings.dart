import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSetting {
  late DotEnv dotEnv;
  late String userId;
  AppSetting._() {
    dotEnv = DotEnv();
  }

  static AppSetting? _instance;
  static AppSetting get instance {
    if (_instance == null) {
      throw UnimplementedError();
    }
    return _instance!;
  }

  static Future<bool> initialize() async {
    _instance = AppSetting._();
    await _instance!.dotEnv.load();
    return true;
  }
}
