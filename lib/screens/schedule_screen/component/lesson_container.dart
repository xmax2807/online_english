import 'package:flutter/material.dart';

import '../../../data/model/schedule_model/upcoming_schedule_model/dto/group_schedule_dto.dart';
import '../../../gen/assets.gen.dart';
import '../../shared_components/teacher_profile_info.dart';

class LessonContainer extends StatelessWidget {
  final Widget? additionWidget;
  final String? additionText;
  final GroupScheduleDTO? data;
  const LessonContainer(
      {super.key, this.additionWidget, this.additionText, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TeacherProfileWidget(
              teacherName: data!.teacherInfo.name,
              nationality: data!.teacherInfo.country,
              avatar: data!.teacherInfo.avatar,
              svgFlag: Assets.flags.fr,
              dimension: 50,
              maxWidth: 100,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data!.getDate(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (additionText != null) Text(additionText!),
                ],
              ),
            ),
          ],
        ),
        additionWidget!,
      ],
    );
  }
}
