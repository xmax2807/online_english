import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utils/global_constants/country_hashmap.dart';

class AppSetting {
  late DotEnv dotEnv;
  late String userId;
  late CountryHelper countryHelper;
  AppSetting._() {
    dotEnv = DotEnv();
    countryHelper = CountryHelper();
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
    await _instance!.countryHelper.initialize();
    return true;
  }
}
