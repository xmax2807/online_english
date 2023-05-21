import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/key_value_models/language_model.dart';
import 'package:online_english/data/repositories/key_value_repository.dart';
import 'package:online_english/data/setting/settings.dart';

import '../data/providers/key_value_repos_provider.dart';

final appSettingService =
    Provider((ref) => AppSettingService(ref.read(keyValueRepositoryProvider)));

class AppSettingService {
  AppSetting get setting => AppSetting.instance;
  final BaseKeyValueRepository _keyvalueRepos;
  AppSettingService(this._keyvalueRepos);

  Future loadEssentialKeyValues() async {
    final learnTopics = await _keyvalueRepos.getLearnTopics();
    if (learnTopics != null) {
      Map<String, String> learnTopicsMap = {
        for (var topic in learnTopics) topic.key: topic.name
      };

      setting.essentialKeyValues.addAll(learnTopicsMap);
    }

    final testPreparations = await _keyvalueRepos.getTestPreparations();
    if (testPreparations != null) {
      Map<String, String> testPreparationsMap = {
        for (var test in testPreparations) test.key: test.name
      };

      setting.essentialKeyValues.addAll(testPreparationsMap);
    }

    final languageList = await _keyvalueRepos.getLanguages();
    if (languageList != null) {
      Map<String, Language> languageMap = {
        for (var lang in languageList) lang.key: lang
      };

      setting.countryHelper.languageMap.addAll(languageMap);
    }
  }
}
