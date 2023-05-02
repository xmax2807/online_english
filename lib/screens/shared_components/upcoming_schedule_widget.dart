import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/shared_components/count_down_widget.dart';
import 'package:online_english/services/upcoming_schedule_service.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

class UpcomingLessonWidget extends ConsumerWidget {
  const UpcomingLessonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(upcomingScheduleService).nextUpcomingSchedules;
    int totalTime = ref.watch(upcomingScheduleService).totalTime;
    if (schedules == null) {
      ref.read(upcomingScheduleService).nextUpcomingSchedule();
      ref.read(upcomingScheduleService).totalTimeMeetingAttended();
      return const CircularProgressIndicator();
    }

    final nearest = schedules.first;
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(
        nearest.scheduleInfo.startTimestamp);
    DateTime endDate =
        DateTime.fromMillisecondsSinceEpoch(nearest.scheduleInfo.endTimestamp);

    return Container(
      //decoration: BoxDecoration(color: MyTheme.colors.primaryColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'Upcoming Lesson',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        schedules.isEmpty
            ? const Text('There is no upcoming lesson ahead')
            : Column(
                children: [
                  Text(
                      '${startDate.toStringFormat()} ${startDate.toStringFormat(format: 'HH:mm')} - ${endDate.toStringFormat(format: 'HH:mm')}'),
                  CountdownWidget(
                      labelText: '',
                      destinationTimestamp: startDate.millisecondsSinceEpoch),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.video_chat),
                    label: const Text('Enter lesson room'),
                    onPressed: () {},
                  )
                ],
              ),
        Text(
            'Total lesson time is ${totalTime ~/ 60} hours ${totalTime % 60} minutes')
      ]),
    );
  }
}
