import 'package:dio/dio.dart';
import 'package:online_english/data/model/key_value_models/learn_topic_model.dart';
import 'package:online_english/data/model/key_value_models/specialty_model.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import '../model/filter_model/teacher_filter/teacher_search.dart';
import '../model/tutor_model/dto/overview_teacher_profile.dart';
import 'dart:developer' as dev;

abstract class ITutorSearchRepository {
  Future<List<SpecialtyModel>?> getSpecialties();
  Future<List<LearnTopicModel>?> getLearnTopics();
  Future<Map<String, dynamic>?> getAll();
  Future<List<dynamic>?> searchATutor(TeacherSearchDTO searchDTO);
}

class TutorSearchRepository implements ITutorSearchRepository {
  final Dio _dio;
  List<TeacherOverviewDTO>? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  TutorSearchRepository(this._dio);
  @override
  Future<List<dynamic>?> searchATutor(TeacherSearchDTO searchDTO) async {
    return _dio
        .post(
      ApiKeys.searchTutor,
      data: searchDTO.toJson(),
    )
        .then<List<dynamic>?>((response) {
      if (response.data == null) return null;
      return response.data['rows'];
    }, onError: _onError);
  }

  @override
  Future<Map<String, dynamic>?> getAll() async {
    var response =
        await _dio.get(ApiKeys.listTutor, queryParameters: <String, dynamic>{
      'perPage': 1000,
      'page': 1,
    });
    if (response.data == null) return null;
    return response.data;
    //.then<List<TeacherOverviewDTO>?>((response) {
    //   dev.log(response.data!.toString());
    //   List<TeacherOverviewDTO> myObjects =
    //       (response.data!['tutors']['rows'] as List).map((e) {
    //     return TeacherOverviewDTO.fromJson(e);
    //   }).toList();
    //   return myObjects;
    // }, onError: _onError);
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
}
