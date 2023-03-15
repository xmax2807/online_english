import 'package:flutter/material.dart';

import 'component/lesson_container.dart';
import 'component/lesson_request_component.dart';

class InProgressScheduleScreen extends StatefulWidget {
  const InProgressScheduleScreen({super.key});

  @override
  State<InProgressScheduleScreen> createState() =>
      _InProgressScheduleScreenState();
}

class _InProgressScheduleScreenState extends State<InProgressScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (ctx, i) => const LessonContainer(
        additionWidget: LessonRequestContainer(),
        additionText: "2 lessons",
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 16,
        endIndent: 16,
        height: 32,
      ),
    );
  }
}
