import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSetting {
  late DotEnv dotEnv;
  AppSetting._() {
    dotEnv = DotEnv();
  }

  static Future<AppSetting> Initialize() async {
    var appSetting = AppSetting._();
    await dotenv.load();
    return appSetting;
  }
}
