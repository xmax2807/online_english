import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/upcoming_schedule_paging_dto.dart';

import '../data/model/schedule_model/upcoming_schedule_model/cancel_reason_model.dart';
import '../data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import '../data/providers/upcoming_schedule_repos_provider.dart';
import '../data/repositories/upcoming_schedule_repository.dart';

final upcomingScheduleService = ChangeNotifierProvider.autoDispose(
    (ref) => UpcomingScheduleService(ref.read(upcomingScheduleReposProvider)));

class UpcomingScheduleService extends ChangeNotifier {
  final UpcomingScheduleRepository _repository;
  late final UpcomingSchedultPagingDTO paging;
  UpcomingScheduleService(this._repository) {
    paging = UpcomingSchedultPagingDTO();
  }

  List<UpcomingScheduleGroup>? _dataList;
  List<UpcomingScheduleGroup>? get dataList => _dataList;

  Future<void> getUpcomingSchedules() async {
    if (_dataList != null) {
      _dataList = null;
      notifyListeners();
    }

    final result = await _repository.getUpcomingSchedule(paging);

    if (result == null) {
      _dataList = [];
      notifyListeners();
      return;
    }

    _dataList = GroupScheduleFactory.createListFromUpcoming(result);
    notifyListeners();
  }

  Future<void> loadMore() async {
    paging.page += 1;
    final result = await _repository.getUpcomingSchedule(paging);

    if (result == null) return;

    final appendList = GroupScheduleFactory.createListFromUpcoming(result);
    _dataList ??= [];
    _dataList!.addAll(appendList);

    notifyListeners();
  }

  List<CancelReasonModel>? _cancelReasons;
  List<CancelReasonModel>? get cancelReasons => _cancelReasons;
  Future<void> getCancelReasons() async {
    _cancelReasons = await _repository.getCancelReasons();
  }

  //cancelRegion
  bool canCancelTimestamp(int startTimestamp) {
    return canCancel(DateTime.fromMillisecondsSinceEpoch(startTimestamp));
  }

  bool canCancel(DateTime startTime) {
    return startTime.subtract(const Duration(hours: 2)).isAfter(DateTime.now());
  }

  Future<String> cancelLesson(
      String lessonId, int reasonId, String? additionalNote) async {
    String? response = await _repository.cancelALesson(lessonId, reasonId);
    if (response != null) {
      getUpcomingSchedules();
      return response;
    }
    return 'Something went wrong, please try again later';
  }

  //go to meeting region
  bool canGoToMeetingIndex(int index, [DateTime? when]) {
    if (_dataList == null) return false;
    if (index >= _dataList!.length) return false;

    return canGoToMeeting(_dataList![index]);
  }

  bool canGoToMeeting(UpcomingScheduleGroup group, [DateTime? when]) {
    when ??= DateTime.now();
    return group.isInRange(when);
  }

  void goToMeeting(UpcomingScheduleGroup group) {}
}
