import 'package:flutter/material.dart';
import 'package:online_english/screens/course_screen/components/lesson_card_component.dart';
import 'package:online_english/screens/shared_components/complex_search_component.dart';
import 'package:online_english/screens/shared_components/my_stateless_listview_widget.dart';
import 'package:online_english/screens/view_course_screen/view_course_screen.dart';

import '../shared_components/my_drop_down.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<Widget> filters = [
    const MyDropDownWidget<String>(
      hint: "Level",
      dataList: ["Begginer", "Intermediate", "Advanced"],
    ),
    const MyDropDownWidget<String>(
      hint: "Choose a Nationality",
      dataList: [
        "Design Pattern",
        "OOP",
        "Game UI System",
        "Deep Learning",
      ],
    ),
    const MyDropDownWidget<String>(
        hint: "Sort level order",
        dataList: ["Hardest to Easiest", "Easiest to Hardest"]),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Find a course",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        MySearchWidget(
                          filters: filters,
                          hintSearch: "Find a course",
                          onSearchClick: null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        for (int i = 0; i < 3; i++)
                          ListTile(
                            title: Text(
                              "ASd",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: SizedBox.fromSize(
                                size: const Size.fromHeight(250),
                                child: MyStatelessListView(
                                    onTapItem: (i) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewCourseScreen(
                                                  courseId: '',
                                                )),
                                      );
                                    },
                                    onBuildWidget: (int index) =>
                                        const LessonCardWidget(),
                                    itemCount: 25,
                                    scrollDirection: Axis.horizontal)),
                          ),
                      ],
                    )))));
  }
}
