import 'package:dio/dio.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/upcoming_schedule_paging_dto.dart';

import '../../utils/global_constants/api_keys.dart';
import '../model/schedule_model/upcoming_schedule_model/cancel_reason_model.dart';
import '../model/schedule_model/upcoming_schedule_model/upcoming_schedule_model.dart';
import 'dart:developer' as dev;

abstract class IUpcomingScheduleRepository {
  Future<List<UpcomingScheduleModel>?> getUpcomingSchedule(
      UpcomingSchedultPagingDTO paging);
  Future<List<CancelReasonModel>?> getCancelReasons();
  Future<String?> cancelALesson(String lessonId, int reasonId);
}

class UpcomingScheduleRepository implements IUpcomingScheduleRepository {
  final Dio _dio;

  UpcomingScheduleRepository(this._dio);

  void _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
  }

  @override
  Future<List<UpcomingScheduleModel>?> getUpcomingSchedule(
      UpcomingSchedultPagingDTO paging) {
    return _dio
        .get(
      ApiKeys.bookedClasses,
      queryParameters: paging.toJson(),
    )
        .then((value) {
      if (value.data == null) return null;

      List dataList = value.data['data']['rows'] as List;

      final result = dataList.map((e) {
        final scheduleInfo = e['scheduleDetailInfo']['scheduleInfo'];
        e['scheduleInfo'] = scheduleInfo;
        return UpcomingScheduleModel.fromJson(e);
      }).toList();
      return result;
    }, onError: _onError);
  }

  @override
  Future<List<CancelReasonModel>?> getCancelReasons() {
    return _dio
        .get(
      ApiKeys.cancelReasons,
    )
        .then((value) {
      if (value.data == null) return null;

      List dataList = value.data['rows'] as List;

      return dataList.map((e) {
        return CancelReasonModel.fromJson(e);
      }).toList();
    }, onError: _onError);
  }

  @override
  Future<String?> cancelALesson(String lessonId, int reasonId) {
    return _dio.delete(ApiKeys.cancelBooking, data: {
      'cancelInfo': {
        'cancelReasonId': reasonId,
      },
      'scheduleDetailId': lessonId,
    }).then(
      (response) {
        if (response.data == null) return null;
        return response.data['message'];
      },
      onError: _onError,
    );
  }
}
