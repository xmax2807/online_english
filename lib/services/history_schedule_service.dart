import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/upcoming_schedule_paging_dto.dart';

import '../data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import '../data/providers/history_schedule_repos_provider.dart';
import '../data/repositories/history_schedule_repository.dart';

final historyScheduleService = ChangeNotifierProvider.autoDispose(
    (ref) => HistoryScheduleService(ref.read(historyScheduleReposProvider)));

class HistoryScheduleService extends ChangeNotifier {
  final HistoryScheduleRepository _repository;
  late final UpcomingSchedultPagingDTO paging;
  late final ScrollController scrollController;
  HistoryScheduleService(this._repository) {
    paging = UpcomingSchedultPagingDTO.history();
    scrollController = ScrollController()..addListener(_handleScroll);
  }

  List<HistoryScheduleGroup>? _dataList;
  List<HistoryScheduleGroup>? get dataList => _dataList;

  Future<void> getHistorySchedules() async {
    if (_dataList != null) {
      _dataList = null;
      notifyListeners();
    }

    final result = await _repository.getHistorySchedules(paging);

    if (result == null) {
      _dataList = [];
      notifyListeners();
      return;
    }

    _dataList = GroupScheduleFactory.createListFromHistory(result);
    notifyListeners();
  }

  Future<void> loadMore() async {
    paging.page += 1;
    final result = await _repository.getHistorySchedules(paging);

    if (result == null) {
      paging.page -= 1;
      return;
    }

    final appendList = GroupScheduleFactory.createListFromHistory(result);
    _dataList ??= [];
    _dataList!.addAll(appendList);

    notifyListeners();
  }

  void _handleScroll() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
