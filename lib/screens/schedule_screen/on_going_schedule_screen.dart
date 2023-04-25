import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/upcoming_schedule_service.dart';
import '../shared_components/empty_data.dart';
import 'component/lesson_container.dart';
import 'component/lesson_request_component.dart';

class InProgressScheduleScreen extends ConsumerStatefulWidget {
  const InProgressScheduleScreen({super.key});

  @override
  ConsumerState<InProgressScheduleScreen> createState() =>
      _InProgressScheduleScreenState();
}

class _InProgressScheduleScreenState
    extends ConsumerState<InProgressScheduleScreen> {
  late final UpcomingScheduleService _service;
  @override
  void initState() {
    super.initState();
    _service = ref.read(upcomingScheduleService);
    _service.getUpcomingSchedules();
    _service.getCancelReasons();
  }

  @override
  Widget build(BuildContext context) {
    final dataList = ref.watch(upcomingScheduleService).dataList;
    if (dataList == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (dataList.isEmpty) {
      return const EmptyDataWidget();
    }
    return ListView.separated(
      itemCount: dataList.length,
      itemBuilder: (ctx, i) => LessonContainer(
        data: dataList[i],
        additionWidget: LessonRequestContainer(_service, dataList[i]),
        additionText: dataList[i].length > 1
            ? '${dataList[i].length} consecutive lessons'
            : '${dataList[i].length} lesson',
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 16,
        endIndent: 16,
        height: 32,
      ),
    );
  }
}
