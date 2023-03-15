import 'package:flutter/material.dart';
import 'package:online_english/data/model/tutor_lesson_review/tutor_lesson_review.dart';
import 'package:online_english/screens/schedule_screen/component/lesson_tutor_review.dart';

import '../../../utils/theme/my_theme.dart';

class LessonResultContainer extends StatelessWidget {
  final String? recordvideoLink;
  final Widget lessonReview = LessonTutorReview(
      model: TutorLessonReviewModel.convert(
    behaviourVal: 1,
    listenVal: 1,
    speakValue: 1,
    vocabVal: 1,
    comment:
        'Quang Huy, you are such an idiot. Please do not attend my class ever again !!!',
  ));
  LessonResultContainer({super.key, this.recordvideoLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
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
          ExpansionTile(
            collapsedShape: RoundedRectangleBorder(
                side: BorderSide(color: MyTheme.colors.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            backgroundColor: MyTheme.colors.onPrimaryColor,
            title: const Text(
              "Tutor's review",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              lessonReview,
            ],
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
