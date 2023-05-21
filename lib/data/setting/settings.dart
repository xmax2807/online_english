import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_english/utils/global_constants/env_consts.dart';
import 'package:online_english/utils/io/path_provider_io.dart';
import 'package:uuid/uuid.dart';

import '../../utils/global_constants/country_hashmap.dart';
import '../../utils/io/savable_interface.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

part 'chat_gpt_setting.dart';
part 'user_settings.dart';
part 'speech_to_text.dart';

class AppSetting {
  late DotEnv dotEnv;
  late String userId;
  late CountryHelper countryHelper;
  late final UserSetting userSetting;
  late Map<String, String> essentialKeyValues;
  static const Uuid uuidGenerator = Uuid();

  AppSetting._() {
    dotEnv = DotEnv();
    countryHelper = CountryHelper();
    userSetting = UserSetting._create();
    essentialKeyValues = {};
  }

  bool _isInitialized = false;
  static bool get isInitialized =>
      _instance != null && _instance!._isInitialized;
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
    await _instance!.userSetting.getData(JsonPathProvider());
    await _instance!.countryHelper.initialize();
    _instance!._isInitialized = true;
    return true;
  }
}
