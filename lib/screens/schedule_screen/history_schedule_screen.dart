import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import 'package:online_english/screens/shared_components/empty_data.dart';

import '../../services/history_schedule_service.dart';
import 'component/lesson_container.dart';
import 'component/lesson_result.dart';
import 'package:timeago/timeago.dart' as timeago;

class LessonResultsScreen extends ConsumerStatefulWidget {
  const LessonResultsScreen({super.key});

  @override
  ConsumerState<LessonResultsScreen> createState() =>
      _LessonResultsScreenState();
}

class _LessonResultsScreenState extends ConsumerState<LessonResultsScreen> {
  late final HistoryScheduleService _service;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _service = ref.read(historyScheduleService);
    _service.getHistorySchedules();
  }

  @override
  Widget build(BuildContext context) {
    now = DateTime.now();
    List<HistoryScheduleGroup>? dataList =
        ref.watch(historyScheduleService).dataList;
    bool isLoadingMore = ref.watch(historyScheduleService).isLoadingMore;
    if (dataList == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (dataList.isEmpty) {
      return const Center(child: EmptyDataWidget());
    }

    return ListView.separated(
      controller: _service.scrollController,
      itemCount: dataList.length + 1,
      itemBuilder: (ctx, i) => i == dataList.length
          ? _onBuildWaitingWidget(isLoadingMore)
          : _onBuildWidget(ctx, dataList[i]),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 16,
        endIndent: 16,
        height: 32,
      ),
    );
  }

  Widget _onBuildWaitingWidget(bool isLoading) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : const SizedBox.shrink();
  }

  Widget _onBuildWidget(BuildContext ctx, HistoryScheduleGroup data) {
    return LessonContainer(
      additionWidget: LessonResultContainer(
        recordvideoLink: data.recordUrl,
        groupData: data,
        service: _service,
      ),
      additionText: timeago.format(data.getDate()),
      data: data,
    );
  }
}
