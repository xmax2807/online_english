import 'package:dio/dio.dart';
import 'package:online_english/data/model/key_value_models/test_preparation_model.dart';
import 'package:online_english/data/model/key_value_models/specialty_model.dart';
import 'package:online_english/data/model/key_value_models/learn_topic_model.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';
import 'dart:developer' as dev;

import 'key_value_repository.dart';

abstract class IProfileRepository {
  Future<UserModel?> getProfile();
  Future<String?> updateAvatar(String filePath);
  Future<bool> updateProfile(Map<String, dynamic> info);
}

class ProfileRepository implements IProfileRepository, IKeyValueRepository {
  final Dio _dio;

  ProfileRepository(this._dio);

  List? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  @override
  Future<UserModel?> getProfile() {
    return _dio.get(ApiKeys.userProfile).then((value) {
      if (value.data == null) return null;
      return UserModel.fromJson(value.data['user']);
    }, onError: _onError);
  }

  @override
  Future<String?> updateAvatar(String filePath) async {
    final MultipartFile data = await MultipartFile.fromFile(filePath);
    final formData = FormData.fromMap({'avatar': data});
    return _dio
        .post(ApiKeys.updateAvatar,
            data: formData,
            options: Options(headers: {
              'accept-encoding': 'gzip, deflate, br',
            }))
        .then((value) {
      if (value.data == null) return null;
      return value.data['avatar'] as String;
    }, onError: _onError);
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
  Future<bool> updateProfile(Map<String, dynamic> info) {
    return _dio.put(ApiKeys.updateInfo, data: info).then(
        (value) => value.data != null && value.statusCode == 200,
        onError: _onError);
  }
}
