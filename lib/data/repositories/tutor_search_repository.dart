import 'package:dio/dio.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import '../model/filter_model/teacher_filter/teacher_search.dart';
import '../model/tutor_model/dto/overview_teacher_profile.dart';
import 'dart:developer' as dev;

abstract class ITutorSearchRepository {
  Future<List<TeacherOverviewDTO>?> getListTutor(TeacherSearchDTO searchDTO);
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
  Future<List<TeacherOverviewDTO>?> getListTutor(TeacherSearchDTO searchDTO) {
    return _dio.get(ApiKeys.listTutor,
        // data: <String, String>{
        //   "studentRequest": '',
        // },
        queryParameters: <String, dynamic>{
          "perPage": 9,
          "page": '1',
        }).then<List<TeacherOverviewDTO>?>((response) {
      dev.log(response.data!.toString());
      List<TeacherOverviewDTO> myObjects =
          (response.data!['tutors']['rows'] as List).map((e) {
        return TeacherOverviewDTO.fromJson(e);
      }).toList();
      for (var element in myObjects) {
        dev.log(element.name);
      }
      return myObjects;
    }, onError: _onError);
  }
}
