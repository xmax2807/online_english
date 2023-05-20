import 'package:dio/dio.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';
import 'dart:developer' as dev;
import '../model/key_value_models/language_model.dart';
import '../model/key_value_models/learn_topic_model.dart';
import '../model/key_value_models/specialty_model.dart';
import '../model/key_value_models/test_preparation_model.dart';

abstract class IKeyValueRepository {
  Future<List<SpecialtyModel>?> getSpecialties();
  Future<List<LearnTopicModel>?> getLearnTopics();
  Future<List<TestPreparationModel>?> getTestPreparations();
  Future<List<Language>?> getLanguages();
}

class BaseKeyValueRepository implements IKeyValueRepository {
  final Dio _dio;

  BaseKeyValueRepository(this._dio);

  List? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  @override
  Future<List<SpecialtyModel>?> getSpecialties() {
    return _dio.get(ApiKeys.specialties).then((response) {
      final data = response.data;
      if (data == null) return null;

      final list = data as List;
      return list.map((e) => SpecialtyModel.fromJson(e)).toList();
    }, onError: _onError);
  }

  @override
  Future<List<LearnTopicModel>?> getLearnTopics() {
    return _dio.get(ApiKeys.learnTopic).then((response) {
      final data = response.data;
      if (data == null) return null;

      final list = data as List;
      return list.map((e) => LearnTopicModel.fromJson(e)).toList();
    }, onError: _onError);
  }

  @override
  Future<List<TestPreparationModel>?> getTestPreparations() {
    return _dio.get(ApiKeys.testPreparation).then((response) {
      final data = response.data;
      if (data == null) return null;

      final list = data as List;
      return list.map((e) => TestPreparationModel.fromJson(e)).toList();
    }, onError: _onError);
  }

  @override
  Future<List<Language>?> getLanguages() {
    return _dio.get(ApiKeys.languages).then((response) {
      final data = response.data;
      if (data == null) return null;

      final list = data as List;
      final languageList = list[0]['categories'] as List;
      return languageList.map((e) => Language.fromJson(e)).toList();
    }, onError: _onError);
  }
}
