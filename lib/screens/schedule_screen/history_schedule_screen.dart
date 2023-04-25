import 'package:flutter/material.dart';

import 'component/lesson_container.dart';
import 'component/lesson_result.dart';

class LessonResultsScreen extends StatelessWidget {
  const LessonResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (ctx, i) => LessonContainer(
        additionWidget: LessonResultContainer(
          recordvideoLink: "Record",
        ),
        additionText: "6 hours ago",
        data: null,
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 16,
        endIndent: 16,
        height: 32,
      ),
    );
  }
}
