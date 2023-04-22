import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/course_model/course_model.dart';
import 'package:online_english/screens/shared_components/my_app_bar_component.dart';
import 'package:online_english/screens/view_course_screen/about_course_screen.dart';
import 'package:online_english/screens/view_course_screen/detail_course_screen.dart';
import 'package:online_english/services/course_service.dart';

class ViewCourseScreen extends ConsumerWidget {
  final String courseId;
  const ViewCourseScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isCourseAvailable =
        ref.watch(courseServiceProvider).currentViewCourse != null;

    if (!isCourseAvailable) {
      ref.read(courseServiceProvider).getCourseDetail(courseId);
      return const CircularProgressIndicator();
    }
    final CourseModel data =
        ref.watch(courseServiceProvider).currentViewCourse!;
    return Scaffold(
        body: MyAppBar(
      title: data.name,
      appbarImageUrl: data.imageUrl,
      tabLabels: const ["About", "Topics"],
      tabWidgets: [
        AboutCourse(
          data: data,
        ),
        CourseTopicsScreen(
          data: data,
        )
      ],
    ));
  }
}
