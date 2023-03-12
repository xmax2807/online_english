import 'package:flutter/material.dart';
import 'package:online_english/screens/course_screen/components/lesson_card_component.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox.fromSize(
      size: const Size.fromHeight(250),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (ctx, i) => const LessonCardWidget(),
          separatorBuilder: (ctx, i) => const SizedBox(
                width: 5,
              ),
          itemCount: 25),
    )));
  }
}
