import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/my_stateless_listview_widget.dart';

import '../../utils/theme/my_theme.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Overview",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: Column(
            children: [
              ListTile(
                title: Text(
                  "Tutor",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.person_4_rounded),
                subtitle: const Text("Asd"),
              ),
              ListTile(
                title: Text(
                  "Who this course is for",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.question_mark_rounded),
                subtitle: const Text("For everyone"),
              ),
              ListTile(
                title: Text(
                  "What you will learn",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.question_mark_rounded),
                subtitle: const Text("Everything"),
              ),
              ListTile(
                title: Text(
                  "Course Length",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.bookmark_added),
                subtitle: const Text("5 topics"),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            "Level Requirement",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: ListTile(
            title: Text(
              "Beginner",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            leading: const Icon(Icons.stars_outlined),
          ),
        ),
        ListTile(
          title: Text(
            "Topics",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: MyStatelessListView(
              onTapItem: (i) => {},
              onBuildWidget: (int index) => ExpansionTile(
                    backgroundColor: MyTheme.colors.onPrimaryColor,
                    title: Text("Topic $index"),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number $index')),
                    ],
                  ),
              itemCount: 5),
        ),
      ],
    );
  }
}
