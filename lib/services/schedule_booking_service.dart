import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/schedule_model/schedule_detail.dart';
import 'package:online_english/data/repositories/tutor_table_schedules.dart';

import '../data/model/schedule_model/dto/schedule_table_dto.dart';
import '../data/providers/tutor_schedule_provider.dart';

final scheduleBookingService = ChangeNotifierProvider.autoDispose(
    (ref) => ScheduleBookingService(ref.read(tutorTableScheduleProvider)));

class ScheduleBookingService extends ChangeNotifier {
  final TutorTableScheduleRepository _repository;

  ScheduleBookingService(this._repository);

  List<ScheduleTableDTO>? _schedules;
  List<ScheduleTableDTO>? get schedules => _schedules;

  Future<void> getTableSchedules(String tutorId) async {
    _schedules = await _repository.getAllSchedules(tutorId);
    _schedules ??= [];
    notifyListeners();
  }

  Future<bool> bookSchedule(String id, String? note) async {
    return await _repository.bookASchedule(id, note);
  }

  ScheduleDetailModel? findSchedule(String id) {
    if (_schedules == null) return null;
    for (var schedule in _schedules!) {
      final result = schedule.scheduleDetails
          .firstWhereOrNull((element) => element.id == id);
      if (result != null) return result;
    }

    return null;
  }

  bool isBookedByOther(ScheduleDetailModel schedule) {
    if (!schedule.isBooked || schedule.bookingInfo.isEmpty) return false;
    return true;
    //return schedule.bookingInfo.last.userId != AppSetting.instance.userId;
  }
}
