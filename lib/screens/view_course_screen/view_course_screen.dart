import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/my_app_bar_component.dart';
import 'package:online_english/screens/view_course_screen/about_course_screen.dart';
import 'package:online_english/screens/view_course_screen/detail_course_screen.dart';

class ViewCourseScreen extends StatelessWidget {
  const ViewCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: MyAppBar(
      courseName: "Design Pattern",
      tabLabels: ["About", "Topics"],
      tabWidgets: [AboutCourse(), CourseTopicsScreen()],
    ));
  }
}
