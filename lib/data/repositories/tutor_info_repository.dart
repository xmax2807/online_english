import 'package:dio/dio.dart';
import 'package:online_english/data/model/tutor_model/dto/detail_teacher_profile.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import '../model/schedule_model/dto/schedule_table_dto.dart';
import '../model/tutor_model/dto/overview_teacher_profile.dart';
import 'dart:developer' as dev;

abstract class ITutorInfoRepository {
  Future<TeacherDetailDTO> getDetail(String tutorId);
  Future<bool> addToFavorite(String tutorId);
  Future<ScheduleTableDTO> getSchedules(String tutorId);
}

class TutorInfoRepository implements ITutorInfoRepository {
  final Dio _dio;
  List<TeacherOverviewDTO>? _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
    return null;
  }

  TutorInfoRepository(this._dio);

  @override
  Future<bool> addToFavorite(String tutorId) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<TeacherDetailDTO> getDetail(String tutorId) {
    return _dio.get('${ApiKeys.tutorInfo}$tutorId').then(
        (value) => TeacherDetailDTO.fromJson(value.data),
        onError: _onError);
  }

  @override
  Future<ScheduleTableDTO> getSchedules(String tutorId) {
    // TODO: implement getSchedules
    throw UnimplementedError();
  }
}
