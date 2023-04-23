import 'package:flutter/material.dart';
import 'package:online_english/screens/shared_components/my_stateless_listview_widget.dart';
import 'package:readmore/readmore.dart';

import '../../data/model/course_model/category_model/category_key.dart';
import '../../data/model/course_model/course_model.dart';
import '../../utils/theme/my_theme.dart';

class AboutCourse extends StatelessWidget {
  final CourseModel data;
  const AboutCourse({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            data.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: Text(data.description),
        ),
        ExpansionTile(
          title: Text(
            "Overview",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          children: [
            ListTile(
              title: Text(
                'Tutor(s)',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.person_4_rounded),
              subtitle: Text(
                  data.users.map<String>((element) => element.name).join(', ')),
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
              subtitle: ReadMoreText(
                data.reason ?? 'For everyone',
                trimLength: 100,
                moreStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                lessStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
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
              subtitle: ReadMoreText(
                data.purpose ?? 'Everything',
                trimLength: 100,
                moreStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                lessStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
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
              subtitle: Text("${data.topics.length} topics"),
            ),
          ],
        ),
        ListTile(
          title: Text(
            "Level Requirement",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: ListTile(
            title: Text(
              categoryLevel.elementAt(data.level == null ? 0 : data.level!),
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
                    title: Text(data.topics[index].name),
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
