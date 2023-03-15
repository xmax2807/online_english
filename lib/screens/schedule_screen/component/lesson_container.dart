import 'package:flutter/material.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../../../gen/assets.gen.dart';
import '../../shared_components/teacher_profile_info.dart';

class LessonContainer extends StatelessWidget {
  final Widget? additionWidget;
  final String? additionText;
  const LessonContainer({super.key, this.additionWidget, this.additionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TeacherProfileWidget(
              teacherName: "ASD",
              nationality: "France",
              svgFlag: Assets.flags.fr,
              dimension: 50,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateTime.now().toStringFormat(),
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
