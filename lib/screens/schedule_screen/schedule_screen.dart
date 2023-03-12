import 'package:flutter/material.dart';
import 'package:online_english/screens/schedule_screen/component/lesson_request_component.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../../gen/assets.gen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TeacherProfileWidget(
                            teacherName: "ASD",
                            nationality: "France",
                            svgFlag: Assets.flags.fr),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: Column(
                            children: [
                              Text(
                                DateTime.now().toStringFormat(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Text("1 Lesson"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const LessonRequestContainer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
