import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import 'package:online_english/data/model/tutor_lesson_review/tutor_lesson_review.dart';
import 'package:online_english/screens/schedule_screen/component/lesson_tutor_review.dart';

import '../../../services/history_schedule_service.dart';
import '../../../utils/theme/my_theme.dart';

class LessonResultContainer extends ConsumerWidget {
  final String? recordvideoLink;
  final HistoryScheduleGroup groupData;
  final HistoryScheduleService service;

  const LessonResultContainer(
      {super.key,
      this.recordvideoLink,
      required this.groupData,
      required this.service});

  Widget onBuildSession(BuildContext context, int index) {
    final ScheduleTime timeData = groupData.lessonTimes[index];
    final review = groupData.lessonTimes[index].review;
    if (review == null) {
      return ListTile(
        title: Text(
          'Session ${index + 1} : ${timeData.durationTime}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
      );
    }
    return ExpansionTile(
      title: Text(
        'Session ${index + 1} : ${timeData.durationTime}',
        style: const TextStyle(fontSize: 16),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lesson status: ${review.lessonStatus!.status}'),
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
                'Book: ${review.book} - Unit: ${review.unit} - Lesson: ${review.lesson} - Page: ${review.page}')),
        Text('Lesson progress: ${review.lessonProgress}'),
        const Divider(),
        review.behaviorRating == null
            ? const Text('Not reviewed yet')
            : LessonTutorReview(
                model: TutorLessonReviewModel.convert(
                  behaviourVal: review.behaviorRating!.toDouble(),
                  behaviourComment: review.behaviorComment!,
                  listenVal: review.listeningRating!.toDouble(),
                  listenComment: review.listeningComment!,
                  speakValue: review.speakingRating!.toDouble(),
                  speakComment: review.speakingComment!,
                  vocabVal: review.vocabularyRating!.toDouble(),
                  vocabComment: review.vocabularyComment!,
                  comment: review.overallComment!,
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                groupData.getGroupTime(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 24, color: MyTheme.colors.primaryColor),
              ),
              if (recordvideoLink != null)
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.video_file),
                  label: const Text("Record"),
                  style: TextButton.styleFrom(minimumSize: const Size(50, 40))
                      .merge(MyTheme.outlineButtonStyle),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // ExpansionTile(
          //   collapsedShape: RoundedRectangleBorder(
          //       side: BorderSide(color: MyTheme.colors.primaryColor),
          //       borderRadius: BorderRadius.circular(10)),
          //   backgroundColor: MyTheme.colors.onPrimaryColor,
          //   title: const Text(
          //     "Tutor's review",
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),

          // ),
          Column(
            children: List.generate(groupData.lessonTimes.length,
                (index) => onBuildSession(context, index)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(MyTheme.colors.red),
                    ).merge(MyTheme.textOnlyStyle),
                    onPressed: () {},
                    child: const Text(
                      "Report",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: MyTheme.textOnlyStyle,
                    onPressed: () {},
                    child: const Text(
                      "Add a rating",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
