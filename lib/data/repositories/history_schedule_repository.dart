import 'package:dio/dio.dart';
import 'package:online_english/data/model/schedule_model/history_schedule_model/history_schedule_model.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/upcoming_schedule_paging_dto.dart';

import '../../utils/global_constants/api_keys.dart';
import 'dart:developer' as dev;

abstract class IHistoryScheduleRepository {
  Future<List<HistoryScheduleModel>?> getHistorySchedules(
      UpcomingSchedultPagingDTO paging);
}

class HistoryScheduleRepository implements IHistoryScheduleRepository {
  final Dio _dio;

  HistoryScheduleRepository(this._dio);

  void _onError(dynamic error) {
    if (error is DioError) {
      dev.log(error.message.toString());
      dev.log(
          error.response == null ? 'null' : error.response!.data.toString());
    }
  }

  @override
  Future<List<HistoryScheduleModel>?> getHistorySchedules(
      UpcomingSchedultPagingDTO paging) {
    return _dio
        .get(
      ApiKeys.bookedClasses,
      queryParameters: paging.toHistoryJson(),
    )
        .then((value) {
      if (value.data == null) return null;

      List dataList = value.data['data']['rows'] as List;

      final result = dataList.map((e) {
        final scheduleInfo = e['scheduleDetailInfo']['scheduleInfo'];
        e['scheduleInfo'] = scheduleInfo;
        return HistoryScheduleModel.fromJson(e);
      }).toList();
      return result;
    }, onError: _onError);
  }
}
