import 'package:flutter/material.dart';
import 'package:online_english/utils/theme/my_theme.dart';

class LessonRequestContainer extends StatefulWidget {
  const LessonRequestContainer({super.key});

  @override
  State<LessonRequestContainer> createState() => _LessonRequestContainerState();
}

class _LessonRequestContainerState extends State<LessonRequestContainer> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 24, color: MyTheme.colors.primaryColor),
              ),
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(50, 40),
                    surfaceTintColor: MyTheme.colors.red,
                    foregroundColor: MyTheme.colors.red,
                    side: BorderSide(color: MyTheme.colors.red, width: 1),
                  ).merge(MyTheme.outlineButtonStyle),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear_rounded,
                    size: 16,
                  ),
                  label: const Text("Cancel"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ExpansionTile(
            collapsedShape: RoundedRectangleBorder(
                side: BorderSide(color: MyTheme.colors.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            backgroundColor: MyTheme.colors.onPrimaryColor,
            title: const Text("Request for lesson"),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
            onExpansionChanged: (bool expanded) => setState(() {
              isExpanded = expanded;
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                    style: MyTheme.outlineButtonStyle,
                    onPressed: () {},
                    child: const Text(
                      "Edit request",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: MyTheme.colors.secondaryColor,
                      foregroundColor: MyTheme.colors.onSecondaryColor,
                    ).merge(MyTheme.flatButtonStyle),
                    onPressed: () {},
                    child: const Text(
                      "Go to meeting",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
