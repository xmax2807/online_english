import 'package:dio/dio.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import '../model/filter_model/teacher_filter/teacher_search.dart';
import '../model/tutor_model/dto/overview_teacher_profile.dart';
import 'dart:developer' as dev;

abstract class ITutorSearchRepository {
  Future<Map<String, dynamic>?> getAll(int perPage, String page);
  Future<List<TeacherOverviewDTO>?> searchATutor(TeacherSearchDTO searchDTO);
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
  Future<List<TeacherOverviewDTO>?> searchATutor(
      TeacherSearchDTO searchDTO) async {
    return _dio
        .post(
      ApiKeys.searchTutor,
      data: searchDTO.toJson(),
    )
        .then<List<TeacherOverviewDTO>?>((response) {
      dev.log(response.data!.toString());
      List<TeacherOverviewDTO> myObjects =
          (response.data!['rows'] as List).map((e) {
        return TeacherOverviewDTO.fromJson(e);
      }).toList();
      for (var element in myObjects) {
        dev.log(element.name);
      }
      return myObjects;
    }, onError: _onError);
  }

  @override
  Future<Map<String, dynamic>?> getAll(int perPage, String page) async {
    var response =
        await _dio.get(ApiKeys.listTutor, queryParameters: <String, dynamic>{
      'perPage': 1000,
      'page': page,
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
}
