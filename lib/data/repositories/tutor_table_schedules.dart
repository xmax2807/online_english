import 'package:dio/dio.dart';
import 'package:online_english/utils/global_constants/api_keys.dart';

import '../model/schedule_model/dto/schedule_table_dto.dart';
import '../../utils/extension_methods/datetime_extension_methods.dart';

abstract class ITutorTableScheduleRepository {
  Future<List<ScheduleTableDTO>?> getAllSchedules(String tutorId);
}

class TutorTableScheduleRepository implements ITutorTableScheduleRepository {
  final Dio _dio;
  TutorTableScheduleRepository(this._dio);
  @override
  Future<List<ScheduleTableDTO>?> getAllSchedules(String tutorId) {
    DateTime current = DateTimeExtension.currentTime;
    DateTime nextWeekendEnd = current.next(DateTime.saturday).endOfThisDay();

    return _dio.get(ApiKeys.schedulesWithTutorId, queryParameters: {
      'tutorId': tutorId,
      'startTimestamp': current.millisecondsSinceEpoch,
      'endTimestamp': nextWeekendEnd.millisecondsSinceEpoch,
    }).then((response) {
      final listData = response.data!['scheduleOfTutor'] as List;
      return listData.map((e) => ScheduleTableDTO.fromJson(e)).toList();
    });
  }
}
